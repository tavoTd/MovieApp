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
        NotificationCenter.default.post(name: Notification.Name("NotificationOpenHome"), object: nil)
    }
}
