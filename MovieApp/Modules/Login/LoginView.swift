//
//  LoginView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class LoginView: UIViewController {
    
    private var ui: LoginViewUI?
    
    public var presenter: LoginPresenterProtocol?
    
    override func loadView() {
        ui = LoginViewUI(navigation: self.navigationController!, delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginView: LoginViewProtocol{
    
    func showLoading() {
        LoaderView.show(parent: self.view)
    }
    
    func hideLoading() {
        LoaderView.dismiss(parent: self.view)
    }
    
    func notifyLogIn(usr: String, credential: String) {
        presenter?.requestLogIn(usr: usr, credential: credential)
    }
    
    func displayErrorLogIn(msg: String) {
        ui?.lbError.isHidden = false
        ui?.lbError.text = msg
    }
}
