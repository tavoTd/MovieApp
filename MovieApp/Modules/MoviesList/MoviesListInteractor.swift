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
    
    func fetchPopularMoviesList() {
        let endpoint = "/popular"
        let params = ["page" : "1"]
        
        moviesListService.request(endpoint: endpoint, params: params) { [weak self] (response, error) in
            
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
                self?.presenter?.responseMoviesList(response: response?.list ?? [])
            }
        }
    }
    
    func fetchToRatedMoviesList() {
        let endpoint = "/top_rated"
        let params = ["page" : "1"]
        
        moviesListService.request(endpoint: endpoint, params: params) { [weak self] (response, error) in
            
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
                self?.presenter?.responseMoviesList(response: response?.list ?? [])
            }
        }
    }
    
    func fetchNowPlayingMoviesList() {
        let endpoint = "/now_playing"
        let params = ["page" : "1"]
        
        moviesListService.request(endpoint: endpoint, params: params) { [weak self] (response, error) in
            
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
                self?.presenter?.responseMoviesList(response: response?.list ?? [])
            }
        }
    }
}
