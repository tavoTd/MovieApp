//
//  HomeProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation

protocol HomeViewProtocol: AnyObject{
    func notifyMovieSelected()
}

protocol HomePresenterProtocol: AnyObject{
    func goToMovieDetail()
}

protocol HomeInteractorProtocol: AnyObject{
}

protocol HomeRouterProtocol: AnyObject{
    func navigateToMoviewDetail()
}
