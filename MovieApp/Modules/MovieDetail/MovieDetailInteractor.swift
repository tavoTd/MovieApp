//
//  MovieDetailInteractor.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import Foundation

class MovieDetailInteractor{
    public weak var presenter: MovieDetailPresenterProtocol?
}

extension MovieDetailInteractor: MovieDetailInteractorProtocol{
}
