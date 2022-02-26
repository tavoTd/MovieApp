//
//  HomeMain.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

open class HomeMain{
    
    public static func createModule(navigation: UINavigationController?) -> UIViewController{
        
        let viewController : HomeView? = HomeView()
        
        if let view = viewController, let nav = navigation{
            let presenter = HomePresenter()
            let router = HomeRouter()
            let interactor = HomeInteractor()
            
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
