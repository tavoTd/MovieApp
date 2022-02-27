//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class MovieDetailView: UIViewController {
    
    private var ui: MovieDetailViewUI?
    public var presenter: MovieDetailPresenterProtocol?
    
    override func loadView() {
        ui = MovieDetailViewUI(navigation: self.navigationController!, delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MovieDetailView: MovieDetailViewProtocol{
}
