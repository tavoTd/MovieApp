//
//  HomePresenter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation

class HomePresenter{
    public weak var view    :   HomeViewProtocol?
    public var router       :   HomeRouterProtocol?
    public var interactor   :   HomeInteractorProtocol?
}

extension HomePresenter: HomePresenterProtocol{
    func goToMovieDetail() {
        router?.navigateToMoviewDetail()
    }
}
