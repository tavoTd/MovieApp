//
//  HomeRouter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class HomeRouter{
    public var navigation: UINavigationController?
}

extension HomeRouter: HomeRouterProtocol{
    
    func navigateToMoviewDetail() {
        if let nav = navigation{
            let view = MovieDetailMain.createModule(navigation: nav)
            
            nav.pushViewController(view, animated: true)
        }
    }
}
