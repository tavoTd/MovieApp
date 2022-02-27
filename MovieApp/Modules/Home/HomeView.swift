//
//  HomeView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class HomeView: UIViewController {
    
    private lazy var homePager: HomePager = {
        let pager = HomePager(navigation: self.navigationController!)
        return pager
    }()
    
    private var ui: HomeViewUI?
    
    override func loadView() {
        ui = HomeViewUI(navigation: self.navigationController!, delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol{
    
    func notifyOptionSelected(option: Int) {
        homePager.setCurrentOption(position: option)
    }
    
    func notifyGetCategoriesList() -> [CategoryOption] {
        return homePager.categories
    }
    
    func notifyGetParentView() -> UIViewController {
        return self
    }
    
    func notifyGetPagerView() -> UIPageViewController {
        return homePager
    }
}
