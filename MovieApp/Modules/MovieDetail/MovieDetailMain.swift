//
//  MovieDetailMain.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

public class MovieDetailMain{
    
    public static func createModule(navigation: UINavigationController?) -> UIViewController{
        
        let viewController : MovieDetailView? = MovieDetailView()
        
        if let view = viewController, let nav = navigation{
            let presenter = MovieDetailPresenter()
            let router = MovieDetailRouter()
            let interactor = MovieDetailInteractor()
            
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
