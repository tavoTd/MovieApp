//
//  MoviesListView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

class MoviesListView: UIViewController {
    
    private var rootViewController: UIViewController? {
        get{
            if #available(iOS 13.0, *) {
                return UIApplication.shared.windows.first?.rootViewController
            } else {
                return UIApplication.shared.keyWindow!.rootViewController
            }
        }
    }
    
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
        if let currentCategory = category{
            presenter?.requestMoviesList(toCategory: currentCategory)
        }
    }
}

extension MoviesListView: MoviesListViewProtocol{
    
    func showLoading() {
        if let view = rootViewController?.view{
            LoaderView.show(parent: view)
        }
    }
    
    func dismissLoading() {
        if let view = rootViewController?.view{
            LoaderView.dismiss(parent: view)
        }
    }
    
    func displayMoviesList(data: [Movie]) {
        ui?.movies = data
    }
    
    func displayFailureMessage(msg: String) {
        print("Error service: \(msg)")
        ui?.movies = []
    }
    
    func notifyMovieSelected(id: String) {
        presenter?.goToMovieDetail(id: id)
    }
}
