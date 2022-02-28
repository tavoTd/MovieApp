//
//  MoviesListRouter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class MoviesListRouter{
    public var navigation: UINavigationController?
}

extension MoviesListRouter: MoviesListRouterProtocol{
    
    func navigateToMoviewDetail(id: String) {
        if let nav = navigation{
            let view = MovieDetailMain.createModule(navigation: nav, movieId: id)
            
            nav.pushViewController(view, animated: true)
        }
    }
}
