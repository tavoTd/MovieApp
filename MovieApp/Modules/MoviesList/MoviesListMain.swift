//
//  MoviesListMain.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

public class MoviesListMain{
    
    public static func createModule(navigation: UINavigationController?,
                                    category: CategoryOption) -> UIViewController{
        
        let viewController : MoviesListView? = MoviesListView()
        
        if let view = viewController, let nav = navigation{
            let presenter = MoviesListPresenter()
            let router = MoviesListRouter()
            let interactor = MoviesListInteractor()
            
            view.category = category
            view.navigation = nav
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
