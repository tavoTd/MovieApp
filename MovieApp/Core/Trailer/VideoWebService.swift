//
//  VideoWebService.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import Foundation

class VideoWebService{
    
    typealias Response  =   VideoResponse
    private let path    =   "https://api.themoviedb.org/3/movie"
    private var params  = [
        "api_key": "354f22d5b42639c3a8010cb4c337416b",
        "language": "es-ES"
    ]
    
    public func request(endpoint: String,
                        params: [String : String],
                        completion: @escaping (Response?, NetworkError?) -> Void){
       
        let completePath = path + endpoint
        
        for item in params{
            self.params[item.key] = item.value
        }
        
        ServiceManager.shared.makeCall(completePath, httpMethod: .get, responseDeserializer: DecodableDeserializer<Response>(), params: self.params) { result in
            
            switch result {
            case .success((let data, _)):
                completion(data, nil)
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
