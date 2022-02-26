//
//  LoginRouter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class LoginRouter{
    public var navigation: UINavigationController?
}

extension LoginRouter: LoginRouterProtocol{
    
    func navigateToHome() {
        if let nav = navigation{
            let view = HomeMain.createModule(navigation: nav)
            
            nav.pushViewController(view, animated: true)
        }
    }
}
