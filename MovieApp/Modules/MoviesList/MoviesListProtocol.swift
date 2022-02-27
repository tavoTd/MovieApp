//
//  MoviesListProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import Foundation

protocol MoviesListViewProtocol: AnyObject{
    func notifyMovieSelected()
}

protocol MoviesListPresenterProtocol: AnyObject{
    func goToMovieDetail()
}

protocol MoviesListInteractorProtocol: AnyObject{
    func fetchMovies()
}

protocol MoviesListRouterProtocol: AnyObject{
    func navigateToMoviewDetail()
}
