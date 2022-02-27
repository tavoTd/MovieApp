//
//  MoviesListPresenter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation

class MoviesListPresenter{
    public weak var view    :   MoviesListViewProtocol?
    public var router       :   MoviesListRouterProtocol?
    public var interactor   :   MoviesListInteractorProtocol?
}

extension MoviesListPresenter: MoviesListPresenterProtocol{
    func goToMovieDetail() {
        interactor?.fetchMovies()
    }
}
