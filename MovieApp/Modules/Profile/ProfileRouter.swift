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
    
    func navigateToMoviewDetail() {
        if let nav = navigation{
            let view = MovieDetailMain.createModule(navigation: nav)
            
            nav.pushViewController(view, animated: true)
        }
    }
}
