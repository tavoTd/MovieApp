//
//  NetworkError.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import Foundation

public struct ErrorResponse : Codable {
    public let message: String
    public let statusCode: String?
    public let dataResponse: Data?
}

public enum NetworkError: Error {
    case notNetwork
    case notFound
    case timeOut
    
    /// Indicates the server responded with an unexpected status code.
    /// - parameter Int: The status code the server respodned with.
    /// - parameter Data?: The raw returned data from the server
    case unexpectedStatusCode(Int, Data?)

    /// Indicates that the server responded using an unknown protocol.
    /// - parameter Data?: The raw returned data from the server
    case badResponse(Data?)

    /// Indicates the server's response could not be deserialized using the given Deserializer.
    /// - parameter Data: The raw returned data from the server
    case malformedResponse(Data?)

    /// Inidcates the server did not respond to the request.
    case noResponse
    
    /// Badn URL
    case badURL
    
    func printData() {
        switch self {
        case .unexpectedStatusCode(_, let data), .badResponse(let data), .malformedResponse(let data):
            if let dataToStr = data {
                print(String(decoding: dataToStr, as: UTF8.self))
            }
        default:
            print("Error diferente")
        }
    }
    
    func genericError() -> ErrorResponse {
        switch self {
            case .badResponse(let data):
            return ErrorResponse(message: "No se pudo obtener una respuesta valida", statusCode: "400", dataResponse: data)
            case .malformedResponse(let data):
            return ErrorResponse(message: "No se pudo obtener una respuesta valida", statusCode: "400", dataResponse: data)
            case .unexpectedStatusCode(let statusCode, let data):
            return ErrorResponse(message: "", statusCode: String(statusCode), dataResponse: data)
            default:
                return ErrorResponse(message: "No se pudo obtener una respuesta valida", statusCode: nil, dataResponse: nil)
        }
    }
}
