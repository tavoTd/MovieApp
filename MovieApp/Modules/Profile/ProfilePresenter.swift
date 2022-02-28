//
//  ProfilePresenter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

class ProfilePresenter{
    public weak var view    :   ProfileViewProtocol?
    public var router       :   ProfileRouterProtocol?
    public var interactor   :   ProfileInteractorProtocol?
}

extension ProfilePresenter: ProfilePresenterProtocol{
    func goToMovieDetail(id: String) {
        router?.navigateToMoviewDetail(id: id)
    }
}
