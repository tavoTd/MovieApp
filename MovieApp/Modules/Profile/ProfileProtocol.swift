//
//  ProfileProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

protocol ProfileViewProtocol: AnyObject{
    func notifyMovieSelected(id: String)
}

protocol ProfilePresenterProtocol: AnyObject{
    func goToMovieDetail(id: String)
}

protocol ProfileInteractorProtocol: AnyObject{
}

protocol ProfileRouterProtocol: AnyObject{
    func navigateToMoviewDetail(id: String)
}
