//
//  SideMenuProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

protocol SideMenuViewProtocol: AnyObject{
    func notifyOptionSelected(_ option: OptionMenu)
}

protocol SideMenuPresenterProtocol: AnyObject{
    func goToProfile()
}

protocol SideMenuInteractorProtocol: AnyObject{
}

protocol SideMenuRouterProtocol: AnyObject{
    func navigateToProfile()
}
