//
//  MoviesListInteractor.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation

class MoviesListInteractor{
    public weak var presenter: MoviesListPresenterProtocol?
    private let moviesListService = MoviesListWebService()
}

extension MoviesListInteractor: MoviesListInteractorProtocol{
    
    func fetchMovies() {
        let endpoint = "/top_rated"
        let params = ["page" : "1"]
        
        moviesListService.request(endpoint: endpoint, params: params) { [weak self] (response, error) in
            
            guard let _ = response else {
                DispatchQueue.main.async {
                    guard let data = error?.genericError().dataResponse else {
//                        self?.presenter?.reponseFailureOperationInformation(message: error?.genericError().message ?? "")
                        return
                    }
                    do{
                        let json = try DictionaryDeserializer().deserialize(data)
//                        self?.presenter?.reponseFailureOperationInformation(message: (json["status_message"] as? String ?? "Intente mas tarde"))
                        
                    }catch {
//                        self?.presenter?.reponseFailureOperationInformation(message: "No se pudo obtener una respuesta valida")
                        return
                    }
                }
                return
            }
            
            DispatchQueue.main.async {
                print(response)
//                self?.presenter?.responsePayment(operationResponse: response?.resultado)
            }
        }
    }
}
