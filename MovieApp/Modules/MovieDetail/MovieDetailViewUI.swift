//
//  MovieDetailViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class MovieDetailViewUI: UIView {
    
    private lazy var navigationView: NavigationView = {
        let navigation = NavigationView()
        navigation.translatesAutoresizingMaskIntoConstraints = false
        return navigation
    }()

    public weak var delegate: MovieDetailViewProtocol?
    
    public convenience init(navigation: UINavigationController, delegate: MovieDetailViewProtocol){
        self.init()
        self.delegate = delegate
        self.backgroundColor = ColorManager.darkGreen
        self.navigationView.configComponents(navigation: navigation, title: "Details")
        
        buildUIComponents()
        buildConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUIComponents(){
        self.addSubview(navigationView)
    }
    
    private func buildConstraints(){
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: self.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
