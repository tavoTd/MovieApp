//
//  ProfileMain.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

public class ProfileMain{
    
    public static func createModule(navigation: UINavigationController?) -> UIViewController{
        
        let viewController : ProfileView? = ProfileView()
        
        if let view = viewController, let nav = navigation{
            let presenter = ProfilePresenter()
            let router = ProfileRouter()
            let interactor = ProfileInteractor()
            
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
