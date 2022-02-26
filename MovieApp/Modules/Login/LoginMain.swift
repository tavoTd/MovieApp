//
//  LoginMain.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

open class LoginMain{
    
    public static func createModule(navigation: UINavigationController?) -> UIViewController{
        
        let viewController : LoginView? = LoginView()
        
        if let view = viewController, let nav = navigation{
            let presenter = LoginPresenter()
            let router = LoginRouter()
            let interactor = LoginInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            
            router.navigation = nav
            interactor.presenter = presenter
            
            return view
        }
        
        return UIViewController()
    }
}
