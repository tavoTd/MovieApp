//
//  HomeViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class HomeViewUI: UIView {

    public weak var delegate: HomeViewProtocol?
    
    public convenience init(navigation: UINavigationController, delegate: HomeViewProtocol){
        self.init()
        self.delegate = delegate
        
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
        self.backgroundColor = UIColor.blue
    }
    
    private func buildConstraints(){
        NSLayoutConstraint.activate([
        ])
    }
}
