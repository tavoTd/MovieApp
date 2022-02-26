//
//  SideMenuPresenter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

class SideMenuPresenter{
    public weak var view    :   SideMenuViewProtocol?
    public var router       :   SideMenuRouterProtocol?
    public var interactor   :   SideMenuInteractorProtocol?
}

extension SideMenuPresenter: SideMenuPresenterProtocol{
    func goToProfile() {
        router?.navigateToProfile()
    }
}
