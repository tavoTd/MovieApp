//
//  LoginInteractor.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation
import Firebase

class LoginInteractor{
    public weak var presenter: LoginPresenterProtocol?
}

extension LoginInteractor: LoginInteractorProtocol{
    
    func postLogIn(usr: String, credential: String) {
        
        Auth.auth().signIn(withEmail: usr, password: credential) { authDataResult, error in
            
            if let errorLogin = error{
                self.presenter?.logInFailure(msg: errorLogin.localizedDescription)
            }else{
                self.presenter?.logInSuccessful()
            }
        }
    }
}
