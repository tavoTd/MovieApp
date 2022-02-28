//
//  MovieDetailPresenter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class MovieDetailPresenter{
    public weak var view    :   MovieDetailViewProtocol?
    public var router       :   MovieDetailRouterProtocol?
    public var interactor   :   MovieDetailInteractorProtocol?
    
    private var movieDetail : MovieDetail?
}

extension MovieDetailPresenter: MovieDetailPresenterProtocol{
    
    func requestMovieDetail(id: String) {
        view?.showLoading()
        interactor?.fetchMovieDetail(id: id)
    }
    
    func responseMoviesDetail(response: MovieDetailResponse?) {
        
        guard let data = response else{
            view?.dismissLoading()
            view?.displayFailureMessage(msg: "No se encontrí informació.")
            return
        }
        
        let baseUrl = "https://image.tmdb.org/t/p/w300/"
        
        let companies = data.companies?.compactMap({ (company) -> Companies in
            return Companies(logo: UIImage.URLimage(url: "\(baseUrl)\(company.logo ?? "")"),
                             name: company.name)
        })
        
        var genders = ""
        
        for (index, item) in (data.genders ?? []).enumerated(){
            genders = "\(genders)\(item.name ?? "")"
            if index < (data.genders?.count ?? 0) - 1{
                genders = "\(genders), "
            }
        }
        
        let movieDetail = MovieDetail(id: data.id,
                                      title: data.title,
                                      originalTitle: data.originalTitle,
                                      poster: UIImage.URLimage(url: "\(baseUrl)\(data.poster ?? "")"),
                                      originalLanguage: data.originalLanguage,
                                      overview: data.overview,
                                      releaseDate: data.releaseDate,
                                      genders: genders,
                                      companies: companies,
                                      popularity: data.popularity
        )
        
        self.movieDetail = movieDetail
        
    }
    
    func responseVideoRequest(response: VideoResponse?) {
        view?.dismissLoading()
        
        if var data = movieDetail{
            
            if let videoArray = response?.list, videoArray.count > 0{
                let videoKey = videoArray[0].key
                data.trailerId = videoKey
            }
            
            view?.displayMoviesDetail(data: data)
        }
    }
    
    func failureRequest(error: String) {
        view?.dismissLoading()
        view?.displayFailureMessage(msg: error)
    }
}
