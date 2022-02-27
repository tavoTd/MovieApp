//
//  MovieDetailPresenter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

class MovieDetailPresenter{
    public weak var view    :   MovieDetailViewProtocol?
    public var router       :   MovieDetailRouterProtocol?
    public var interactor   :   MovieDetailInteractorProtocol?
}

extension MovieDetailPresenter: MovieDetailPresenterProtocol{
}
