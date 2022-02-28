//
//  MoviesListPresenter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class MoviesListPresenter{
    public weak var view    :   MoviesListViewProtocol?
    public var router       :   MoviesListRouterProtocol?
    public var interactor   :   MoviesListInteractorProtocol?
}

extension MoviesListPresenter: MoviesListPresenterProtocol{
    
    func requestMoviesList(toCategory: CategoryOption) {
        view?.showLoading()
        
        switch toCategory {
        case .Popular:
            interactor?.fetchPopularMoviesList()
            break
            
        case .ToRated:
            interactor?.fetchToRatedMoviesList()
            break
            
        case .OnTV, .AiringToday:
            interactor?.fetchNowPlayingMoviesList()
            break
        }
    }
    
    func responseMoviesList(response: [MoviesListResponse._Movie]) {
        
        let baseUrl = "https://image.tmdb.org/t/p/w300/"
        
        let moviesList = response.compactMap { (movie) -> Movie in
            return Movie(id: movie.id ?? 0,
                         title: movie.title ?? "",
                         originalTitle: movie.originalTitle ?? "",
                         poster: UIImage.URLimage(url: "\(baseUrl)\(movie.poster ?? "")"),
                         originalLanguage: movie.originalLanguage ?? "",
                         description: movie.overview ?? "",
                         releaseDate: movie.releaseDate ?? "",
                         score: "\(movie.popularity ?? 0.0)"
            )
        }
        
        view?.dismissLoading()
        view?.displayMoviesList(data: moviesList)
    }
    
    func failureRequest(error: String) {
        view?.dismissLoading()
        view?.displayFailureMessage(msg: error)
    }
    
    func goToMovieDetail(id: String) {
        router?.navigateToMoviewDetail(id: id)
    }
}
