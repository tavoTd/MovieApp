//
//  LoginProtocol.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation
import UIKit

protocol LoginViewProtocol: AnyObject{
    func showLoading()
    func hideLoading()
    
    func notifyLogIn(usr: String, credential: String)
    func displayErrorLogIn(msg: String)
}

protocol LoginPresenterProtocol: AnyObject{
    func requestLogIn(usr: String, credential: String)
    
    func logInSuccessful()
    func logInFailure(msg: String)
}

protocol LoginInteractorProtocol: AnyObject{
    func postLogIn(usr: String, credential: String)
}

protocol LoginRouterProtocol: AnyObject{
    func navigateToHome()
}
