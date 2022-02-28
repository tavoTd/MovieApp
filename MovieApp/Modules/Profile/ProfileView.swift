//
//  ProfileView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class ProfileView: UIViewController {
    
    private var ui: ProfileViewUI?
    public var presenter: ProfilePresenterProtocol?
    
    override func loadView() {
        ui = ProfileViewUI(navigation: self.navigationController!, delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileView: ProfileViewProtocol{
    func notifyMovieSelected(id: String) {
        presenter?.goToMovieDetail(id: id)
    }
}
