//
//  ProfileInteractor.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

class ProfileInteractor{
    public weak var presenter: ProfilePresenterProtocol?
}

extension ProfileInteractor: ProfileInteractorProtocol{
}
