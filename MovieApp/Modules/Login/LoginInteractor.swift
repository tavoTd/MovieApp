//
//  LoginInteractor.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation

class LoginInteractor{
    public weak var presenter: LoginPresenterProtocol?
}

extension LoginInteractor: LoginInteractorProtocol{
    
    func postLogIn(usr: String, credential: String) {
    }
}
