//
//  HomeViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

enum CategoryOption: String{
    case Popular        =   "Popular"
    case ToRated        =   "To Rated"
    case OnTV           =   "On TV"
    case AiringToday    =   "Airing Today"
}

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
    
    private lazy var movieCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = UICollectionViewFlowLayout.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieViewCell.identifier)
        return collectionView
    }()
    
    private var moviesTest = [MovieTest(name: "Zombie 1", score: "8.0"),
                              MovieTest(name: "Zombie 2", score: "8.5"),
                              MovieTest(name: "Zombie 3", score: "9.0"),
                              MovieTest(name: "Zombie 4", score: "9.0"),
                              MovieTest(name: "Zombie 5", score: "9.5"),
                              MovieTest(name: "La noche de los muertos vivientes", score: "10.0")]

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
        self.addSubview(movieCollection)
    }
    
    private func buildConstraints(){
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: self.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 20.0),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.0),
            
            movieCollection.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30.0),
            movieCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            movieCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            movieCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configCategories(){
        
        let categoriesArray : [CategoryOption] = [.Popular, .ToRated, .OnTV, .AiringToday]
        
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
    
    @objc private func onOptionClicked(_ sender: UITapGestureRecognizer) {
        
        if let optionSelected = sender.view?.tag{
            self.deselectOptions()
            categories[optionSelected].setTabStatus(.Selected)
        }
    }
    
    private func deselectOptions(){
        for category in categories{
            category.setTabStatus(.Deselected)
        }
    }
}

extension HomeViewUI: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesTest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemsByRow : CGFloat = 2
        let availableWidth = movieCollection.frame.width - 20.0
        let width = availableWidth / itemsByRow
        let height  = 320.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieViewCell.identifier, for: indexPath) as! MovieViewCell
        let movie = moviesTest[indexPath.row]
        
        cell.setMovieInfo(info: movie)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

