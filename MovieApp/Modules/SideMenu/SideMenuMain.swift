//
//  SideMenuMain.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

public class SideMenuMain{
    
    public static func createModule(navigation: UINavigationController?) -> UIViewController{
        
        let viewController : SideMenuView? = SideMenuView()
        
        if let view = viewController, let nav = navigation{
            let presenter = SideMenuPresenter()
            let router = SideMenuRouter()
            let interactor = SideMenuInteractor()
            
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
