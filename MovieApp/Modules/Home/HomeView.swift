//
//  HomeView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class HomeView: UIViewController {
    
    private var ui: HomeViewUI?
    public var presenter: HomePresenterProtocol?
    
    override func loadView() {
        ui = HomeViewUI(navigation: self.navigationController!, delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol{
}
