//
//  ProfileViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class ProfileViewUI: UIView {
    
    private lazy var navigationView: NavigationView = {
        let navigation = NavigationView()
        navigation.translatesAutoresizingMaskIntoConstraints = false
        return navigation
    }()
    
    public lazy var imgProfile: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 30.0
        imgView.image = UIImage(named: "img_profile", in: Bundle.local, compatibleWith: nil)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    public lazy var lbNameProfile: UILabel = {
        let lb = UILabel()
        lb.text = "@gustavoTd"
        lb.textColor = ColorManager.fluorescentGreen
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.numberOfLines = 1
        lb.minimumScaleFactor = 0.6
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    public lazy var lbTitleSection: UILabel = {
        let lb = UILabel()
        lb.text = "Favorite Shows"
        lb.textColor = ColorManager.fluorescentGreen
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.numberOfLines = 1
        lb.minimumScaleFactor = 0.6
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var movieCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = UICollectionViewFlowLayout.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieViewCell.identifier)
        return collectionView
    }()
    
    private var movies = [
        Movie(id: 634649,
              title: "Spider-Man: No Way Home",
              originalTitle: "Spider-Man: No Way Home",
              poster: UIImage.URLimage(url: "https://image.tmdb.org/t/p/w300/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg"),
              originalLanguage: "en",
              description: "Peter Parker es desenmascarado y por tanto no es capaz de separar su vida normal de los enormes riesgos que conlleva ser un s??per h??roe. Cuando pide ayuda a Doctor Strange, los riesgos pasan a ser a??n m??s peligrosos, oblig??ndole a descubrir lo que realmente significa ser Spider-Man.",
              releaseDate: "2021-12-15",
              score: "8.3"),
        Movie(id: 634649,
              title: "Spider-Man: No Way Home",
              originalTitle: "Spider-Man: No Way Home",
              poster: UIImage.URLimage(url: "https://image.tmdb.org/t/p/w300/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg"),
              originalLanguage: "en",
              description: "Peter Parker es desenmascarado y por tanto no es capaz de separar su vida normal de los enormes riesgos que conlleva ser un s??per h??roe. Cuando pide ayuda a Doctor Strange, los riesgos pasan a ser a??n m??s peligrosos, oblig??ndole a descubrir lo que realmente significa ser Spider-Man.",
              releaseDate: "2021-12-15",
              score: "8.3"),
        Movie(id: 634649,
              title: "Spider-Man: No Way Home",
              originalTitle: "Spider-Man: No Way Home",
              poster: UIImage.URLimage(url: "https://image.tmdb.org/t/p/w300/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg"),
              originalLanguage: "en",
              description: "Peter Parker es desenmascarado y por tanto no es capaz de separar su vida normal de los enormes riesgos que conlleva ser un s??per h??roe. Cuando pide ayuda a Doctor Strange, los riesgos pasan a ser a??n m??s peligrosos, oblig??ndole a descubrir lo que realmente significa ser Spider-Man.",
              releaseDate: "2021-12-15",
              score: "8.3"),
        Movie(id: 634649,
              title: "Spider-Man: No Way Home",
              originalTitle: "Spider-Man: No Way Home",
              poster: UIImage.URLimage(url: "https://image.tmdb.org/t/p/w300/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg"),
              originalLanguage: "en",
              description: "Peter Parker es desenmascarado y por tanto no es capaz de separar su vida normal de los enormes riesgos que conlleva ser un s??per h??roe. Cuando pide ayuda a Doctor Strange, los riesgos pasan a ser a??n m??s peligrosos, oblig??ndole a descubrir lo que realmente significa ser Spider-Man.",
              releaseDate: "2021-12-15",
              score: "8.3")
    ]

    public weak var delegate: ProfileViewProtocol?
    
    public convenience init(navigation: UINavigationController, delegate: ProfileViewProtocol){
        self.init()
        self.delegate = delegate
        self.backgroundColor = ColorManager.darkGreen
        self.navigationView.configComponents(navigation: navigation, title: "Profile")
        
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
        self.addSubview(imgProfile)
        self.addSubview(lbNameProfile)
        self.addSubview(lbTitleSection)
        self.addSubview(movieCollection)
    }
    
    private func buildConstraints(){
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: self.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            imgProfile.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 30.0),
            imgProfile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            imgProfile.heightAnchor.constraint(equalToConstant: 60.0),
            imgProfile.widthAnchor.constraint(equalToConstant: 60.0),
            
            lbNameProfile.centerYAnchor.constraint(equalTo: imgProfile.centerYAnchor),
            lbNameProfile.leadingAnchor.constraint(equalTo: imgProfile.trailingAnchor,constant: 20.0),
            lbNameProfile.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.0),
            
            lbTitleSection.topAnchor.constraint(equalTo: imgProfile.bottomAnchor, constant: 50.0),
            lbTitleSection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            
            movieCollection.topAnchor.constraint(equalTo: lbTitleSection.bottomAnchor, constant: 30.0),
            movieCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            movieCollection.heightAnchor.constraint(equalToConstant: 320.0),
            movieCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0)
        ])
    }
}

extension ProfileViewUI: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemsByRow : CGFloat = 2
        let availableWidth = movieCollection.frame.width - 20.0
        let width = availableWidth / itemsByRow
        let height  = movieCollection.frame.height
        
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
