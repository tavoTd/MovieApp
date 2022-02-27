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
        if let view = viewController{
            
            return view
        }
        
        return UIViewController()
    }
}
