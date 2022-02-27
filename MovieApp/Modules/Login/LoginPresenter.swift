//
//  LoginPresenter.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation

class LoginPresenter{
    public weak var view    :   LoginViewProtocol?
    public var router       :   LoginRouterProtocol?
    public var interactor   :   LoginInteractorProtocol?
}

extension LoginPresenter: LoginPresenterProtocol{
    
    func requestLogIn(usr: String, credential: String) {
        view?.showLoading()
        interactor?.postLogIn(usr: usr, credential: credential)
    }
    
    func logInSuccessful() {
        view?.hideLoading()
        router?.navigateToHome()
    }
    
    func logInFailure(msg: String) {
        view?.hideLoading()
        view?.displayErrorLogIn(msg: msg)
    }
}
