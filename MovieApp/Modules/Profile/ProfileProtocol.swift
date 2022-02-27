//
//  ProfileProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

protocol ProfileViewProtocol: AnyObject{
    func notifyMovieSelected()
}

protocol ProfilePresenterProtocol: AnyObject{
    func goToMovieDetail()
}

protocol ProfileInteractorProtocol: AnyObject{
}

protocol ProfileRouterProtocol: AnyObject{
    func navigateToMoviewDetail()
}
