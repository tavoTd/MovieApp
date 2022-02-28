//
//  ProfileRouter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class ProfileRouter{
    public var navigation: UINavigationController?
}

extension ProfileRouter: ProfileRouterProtocol{
    
    func navigateToMoviewDetail(id: String) {
        if let nav = navigation{
            let view = MovieDetailMain.createModule(navigation: nav, movieId: id)
            
            nav.pushViewController(view, animated: true)
        }
    }
}
