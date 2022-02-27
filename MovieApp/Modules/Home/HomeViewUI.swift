//
//  HomeViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class HomeViewUI: UIView {
    
    private lazy var navigationView: NavigationView = {
        let navigation = NavigationView()
        navigation.translatesAutoresizingMaskIntoConstraints = false
        return navigation
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 0
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.layer.cornerRadius = 8.0
        stack.backgroundColor = ColorManager.darkBlue
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var bodyContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        if let parentView = delegate?.notifyGetParentView(), let pager = delegate?.notifyGetPagerView(){
            parentView.addChild(pager)
            pager.view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(pager.view)
            NSLayoutConstraint.activate([
                pager.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                pager.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                pager.view.topAnchor.constraint(equalTo: view.topAnchor),
                pager.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            pager.didMove(toParent: parentView)
        }
        return view
    }()

    private var categories: [TabView] = []
    public weak var delegate: HomeViewProtocol?
    
    public convenience init(navigation: UINavigationController, delegate: HomeViewProtocol){
        self.init()
        self.delegate = delegate
        self.backgroundColor = ColorManager.darkGreen
        self.navigationView.configComponents(navigation: navigation,
                                             title: "TV Shows",
                                             iconLeftButton: nil,
                                             iconRightButton: "icon_menu")
        
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
        
        configCategories()
        
        self.addSubview(navigationView)
        self.addSubview(stackView)
        self.addSubview(bodyContainer)
    }
    
    private func buildConstraints(){
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: self.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 20.0),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.0),
            
            bodyContainer.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            bodyContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bodyContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bodyContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configCategories(){
        
        if let categoriesArray = delegate?.notifyGetCategoriesList(){
            
            for (index, category) in categoriesArray.enumerated(){
                let option = TabView(title: category.rawValue)
                let tap = UITapGestureRecognizer(target: self, action: #selector(onOptionClicked(_:)))
                
                option.addGestureRecognizer(tap)
                option.tag = index
                
                self.categories.append(option)
                self.stackView.addArrangedSubview(option)
            }
            
            categories[0].setTabStatus(.Selected)
        }
    }
    
    @objc private func onOptionClicked(_ sender: UITapGestureRecognizer) {
        
        if let optionSelected = sender.view?.tag{
            self.deselectOptions()
            categories[optionSelected].setTabStatus(.Selected)
            delegate?.notifyOptionSelected(option: optionSelected)
        }
    }
    
    private func deselectOptions(){
        for category in categories{
            category.setTabStatus(.Deselected)
        }
    }
}
