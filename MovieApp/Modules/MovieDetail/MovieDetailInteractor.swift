//
//  MovieDetailInteractor.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

class MovieDetailInteractor{
    public weak var presenter: MovieDetailPresenterProtocol?
    private var movieDeatilService = MovieDetailWebService()
}

extension MovieDetailInteractor: MovieDetailInteractorProtocol{
    
    func fetchMovieDetail(id: String) {
        let endpoint = "/\(id)"
        let params : [String : String] = [:]
        
        movieDeatilService.request(endpoint: endpoint, params: params) { [weak self] (response, error) in
            
            guard let _ = response else {
                DispatchQueue.main.async {
                    guard let data = error?.genericError().dataResponse else {
                        self?.presenter?.failureRequest(error: error?.genericError().message ?? "")
                        return
                    }
                    do{
                        let json = try DictionaryDeserializer().deserialize(data)
                        self?.presenter?.failureRequest(error: (json["status_message"] as? String ?? "Intente más tarde"))
                        
                    }catch {
                        self?.presenter?.failureRequest(error: "No se pudo obtener una respuesta valida")
                        return
                    }
                }
                return
            }
            
            DispatchQueue.main.async {
                self?.presenter?.responseMoviesDetail(response: response)
            }
        }
    }
}
