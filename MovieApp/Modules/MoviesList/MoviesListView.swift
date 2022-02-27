//
//  MoviesListView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

class MoviesListView: UIViewController {
    
    public var navigation: UINavigationController?
    public var category: CategoryOption?
    
    private var ui: MoviesListViewUI?
    public var presenter: MoviesListPresenterProtocol?
    
    override func loadView() {
        ui = MoviesListViewUI(navigation: self.navigation!, delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MoviesListView: MoviesListViewProtocol{
    
    func notifyMovieSelected() {
    }
}
