//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class MovieDetailView: UIViewController {
    
    public var movieId: String?
    
    private var ui: MovieDetailViewUI?
    public var presenter: MovieDetailPresenterProtocol?
    
    override func loadView() {
        ui = MovieDetailViewUI(navigation: self.navigationController!, delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movieId = movieId {
            presenter?.requestMovieDetail(id: movieId)
        }
    }
}

extension MovieDetailView: MovieDetailViewProtocol{
    
    func showLoading() {
        LoaderView.show(parent: self.view)
    }
    
    func dismissLoading() {
        LoaderView.dismiss(parent: self.view)
    }
    
    func displayMoviesDetail(data: MovieDetail) {
        ui?.buildInfo(data: data)
    }
    
    func displayFailureMessage(msg: String) {
        let alert = UIAlertController(title: "Aviso", message: msg, preferredStyle: .alert)
        
        let actionAccept = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default) { action in
            
            if let nav = self.navigationController{
                nav.popViewController(animated: true)
            }
        }
        alert.addAction(actionAccept)
        
        self.present(alert, animated: true, completion: nil)
    }
}
