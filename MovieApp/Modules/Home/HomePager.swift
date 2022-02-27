//
//  HomePager.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

public enum CategoryOption: String{
    case Popular        =   "Popular"
    case ToRated        =   "To Rated"
    case OnTV           =   "On TV"
    case AiringToday    =   "Airing Today"
}

class HomePager: UIPageViewController{
    
    private var navigation          :   UINavigationController?
    private var pagerControllers    :   [UIViewController] = []
    public var categories           :   [CategoryOption] = []
    private var activeTag           :   Int = 0
    
    convenience init(navigation: UINavigationController) {
        self.init()
        self.navigation = navigation
        buildOptions()
    }
    
    private func buildOptions() {
        
        self.categories = [.Popular, .ToRated, .OnTV, .AiringToday]
        
        for category in self.categories{
            let view = MoviesListMain.createModule(navigation: self.navigation, category: category)
            pagerControllers.append(view)
        }
        
        self.setViewControllers([pagerControllers[0]], direction: .forward, animated: false, completion: nil)
    }
    
    public func setCurrentOption(position: Int){
        self.setViewControllers([pagerControllers[position]],
                                direction: activeTag > position ? .reverse : .forward,
                                animated: false,
                                completion: nil)
        activeTag = position
    }
}
