//
//  MovieDetailProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

protocol MovieDetailViewProtocol: AnyObject{
    func showLoading()
    func dismissLoading()
    
    func displayMoviesDetail(data: MovieDetail)
    func displayFailureMessage(msg: String)
}

protocol MovieDetailPresenterProtocol: AnyObject{
    func requestMovieDetail(id: String)
    
    func responseMoviesDetail(response: MovieDetailResponse?)
    func failureRequest(error: String)
}

protocol MovieDetailInteractorProtocol: AnyObject{
    func fetchMovieDetail(id: String)
}

protocol MovieDetailRouterProtocol: AnyObject{
}
