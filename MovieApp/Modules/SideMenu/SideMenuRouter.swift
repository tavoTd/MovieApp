//
//  SideMenuRouter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class SideMenuRouter{
    public var navigation: UINavigationController?
}

extension SideMenuRouter: SideMenuRouterProtocol{
    
    func navigateToProfile() {
        if let nav = navigation{
            let view = ProfileMain.createModule(navigation: nav)
            
            nav.pushViewController(view, animated: true)
        }
    }
}
