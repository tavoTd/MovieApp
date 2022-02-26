//
//  HomeInteractor.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import Foundation

class HomeInteractor{
    public weak var presenter: HomePresenterProtocol?
}

extension HomeInteractor: HomeInteractorProtocol{
}
