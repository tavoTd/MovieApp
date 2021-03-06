//
//  MoviesListViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

class MoviesListViewUI: UIView {
    
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
    
    public var movies : [Movie] = []{
        didSet{
            movieCollection.reloadData()
        }
    }

    public weak var delegate: MoviesListViewProtocol?
    
    public convenience init(navigation: UINavigationController, delegate: MoviesListViewProtocol){
        self.init()
        self.delegate = delegate
        self.backgroundColor = ColorManager.darkGreen
        
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
        self.addSubview(movieCollection)
    }
    
    private func buildConstraints(){
        NSLayoutConstraint.activate([
            movieCollection.topAnchor.constraint(equalTo: self.topAnchor, constant: 30.0),
            movieCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            movieCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            movieCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension MoviesListViewUI: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
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
        let movie = movies[indexPath.row]
        
        cell.setMovieInfo(info: movie)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieId = "\(movies[indexPath.row].id)"
        delegate?.notifyMovieSelected(id: movieId)
    }
}
