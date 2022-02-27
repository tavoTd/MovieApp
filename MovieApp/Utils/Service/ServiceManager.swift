//
//  ServiceManager.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import Foundation

public class ServiceManager{
    
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    public static var shared: ServiceManager = ServiceManager()
    
    
    
    public func makeCall<T: Deserializer>(_ relativePath: String,
                                          httpMethod: RequestType,
                                          responseDeserializer: T,
                                          params: [String : String] = [:],
                                          callback: @escaping (Result<(T.ResponseType, HTTPURLResponse),
                                                               NetworkError>) -> ()) {
        
        makeTask(httpMethod: httpMethod,
                 path: relativePath,
                 params: params,
                 accept: responseDeserializer.acceptHeader) { result in
            
            switch result {
            case .success((let data, let urlResponse)):
                guard let transformedResponse = try? responseDeserializer.deserialize(data) else {
                    callback(.failure(NetworkError.malformedResponse(data)))
                    return
                }
                callback(.success((transformedResponse, urlResponse)))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    private func makeTask(httpMethod: RequestType,
                          path: String,
                          params: [String : String] = [:],
                          accept: String,
                          callback: @escaping (Result<(Data, HTTPURLResponse), NetworkError>) -> ()){
        
        dataTask?.cancel()
        
        var urlService = URL(string: path)
        
        for item in params{
            urlService = urlService?.appending(item.key, value: item.value)
        }
        
        guard let url = urlService else {
            print("Fallo en creacion url...")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData , timeoutInterval: 30)
        request.httpMethod = httpMethod.rawValue
        request.setValue(accept, forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        ServiceManager.log(request: request)
        session.configuration.urlCache = nil
        
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if let responseURL = response as? HTTPURLResponse {
                ServiceManager.log(data: data, response: responseURL, error: error)
            }
            
            if let _ = error {
                callback(.failure(NetworkError.badResponse(data)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                callback(.failure(NetworkError.badResponse(data)))
                return
            }

            if httpResponse.statusCode != 200 && httpResponse.statusCode != 201 {
                callback(.failure(NetworkError.unexpectedStatusCode(httpResponse.statusCode, data)))
                return
            }

            guard let returnedData = data else {
                callback(.failure(NetworkError.noResponse))
                return
            }
            
            callback(.success((returnedData, httpResponse)))
            
        })
        
        dataTask?.resume()
    }
    
    private class func log(request: URLRequest){

        let urlString = request.url?.absoluteString ?? ""
        let components = NSURLComponents(string: urlString)

        let method = request.httpMethod != nil ? "\(request.httpMethod!)": ""
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        let host = "\(components?.host ?? "")"

        var requestLog = "\n---------- REQUEST ---------->\n"
        requestLog += "\(urlString)"
        requestLog += "\n\n"
        requestLog += "\(method) \(path)?\(query) HTTP/1.1\n"
        requestLog += "Host: \(host)\n"
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            requestLog += "\(key): \(value)\n"
        }
        if let body = request.httpBody{
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded";
            requestLog += "\n\(bodyString)\n"
        }

        requestLog += "\n------------------------->\n";
        print(requestLog)
    }

    private class func log(data: Data?, response: HTTPURLResponse?, error: Error?){

        let urlString = response?.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")

        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"

        var responseLog = "\n<---------- RESPONSE ----------\n"
        if let urlString = urlString {
            responseLog += "\(urlString)"
            responseLog += "\n\n"
        }

        if let statusCode =  response?.statusCode{
            responseLog += "HTTP \(statusCode) \(path)?\(query)\n"
        }
        if let host = components?.host{
            responseLog += "Host: \(host)\n"
        }
        for (key,value) in response?.allHeaderFields ?? [:] {
            responseLog += "\(key): \(value)\n"
        }
        if let body = data{
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded";
            responseLog += "\n\(bodyString)\n"
        }
        if let error = error{
            responseLog += "\nError: \(error.localizedDescription)\n"
        }

        responseLog += "<------------------------\n";
        print(responseLog)
    }
}
