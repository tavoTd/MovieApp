//
//  MoviesListProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import Foundation

protocol MoviesListViewProtocol: AnyObject{
    func showLoading()
    func dismissLoading()
    
    func displayMoviesList(data: [Movie])
    func displayFailureMessage(msg: String)
    
    func notifyMovieSelected(id: String)
}

protocol MoviesListPresenterProtocol: AnyObject{
    func requestMoviesList(toCategory: CategoryOption)
    
    func responseMoviesList(response: [MoviesListResponse._Movie])
    func failureRequest(error: String)
    func goToMovieDetail(id: String)
}

protocol MoviesListInteractorProtocol: AnyObject{
    func fetchPopularMoviesList()
    func fetchToRatedMoviesList()
    func fetchNowPlayingMoviesList()
}

protocol MoviesListRouterProtocol: AnyObject{
    func navigateToMoviewDetail(id: String)
}
