//
//  MovieDetailViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit
import YoutubeKit

class MovieDetailViewUI: UIView {
    
    private lazy var navigationView: NavigationView = {
        let navigation = NavigationView()
        navigation.translatesAutoresizingMaskIntoConstraints = false
        return navigation
    }()
    
    private lazy var contentScroll: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 30
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var headerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imgMovie: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var headerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var descriptionContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lbDescriptionTitle: UILabel = {
        let lb = UILabel()
        lb.text = "Descripción:"
        lb.textColor = ColorManager.fluorescentGreen
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.isHidden = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var lbDescription: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.white
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var trailerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.isHidden = true
        view.alpha = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var player: YTSwiftyPlayer!

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyStyle(view: imgMovie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUIComponents(){
        
        headerContainer.addSubview(imgMovie)
        headerContainer.addSubview(headerStack)
        
        descriptionContainer.addSubview(lbDescriptionTitle)
        descriptionContainer.addSubview(lbDescription)
        
        stackView.addArrangedSubview(headerContainer)
        stackView.addArrangedSubview(descriptionContainer)
        stackView.addArrangedSubview(trailerContainer)
        
        containerView.addSubview(stackView)
        contentScroll.addSubview(containerView)
        
        self.addSubview(navigationView)
        self.addSubview(contentScroll)
    }
    
    private func buildConstraints(){
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: self.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            contentScroll.topAnchor.constraint(equalTo: navigationView.bottomAnchor),
            contentScroll.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentScroll.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentScroll.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: self.contentScroll.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.contentScroll.leadingAnchor),
            containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            containerView.trailingAnchor.constraint(equalTo: self.contentScroll.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentScroll.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            
            imgMovie.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 40.0),
            imgMovie.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 20.0),
            imgMovie.heightAnchor.constraint(equalToConstant: 250.0),
            imgMovie.widthAnchor.constraint(equalToConstant: 150.0),
            imgMovie.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor),
            
            headerStack.topAnchor.constraint(equalTo: headerContainer.topAnchor, constant: 40.0),
            headerStack.leadingAnchor.constraint(equalTo: imgMovie.trailingAnchor, constant: 20.0),
            headerStack.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor, constant: -20.0),
            headerStack.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor),
            
            lbDescriptionTitle.topAnchor.constraint(equalTo: descriptionContainer.topAnchor),
            lbDescriptionTitle.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: 20.0),
            lbDescriptionTitle.heightAnchor.constraint(equalToConstant: 40.0),
            lbDescriptionTitle.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: -20.0),
            
            lbDescription.topAnchor.constraint(equalTo: lbDescriptionTitle.bottomAnchor),
            lbDescription.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: 20.0),
            lbDescription.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: -20.0),
            lbDescription.bottomAnchor.constraint(equalTo: descriptionContainer.bottomAnchor)
        ])
    }
    
    private func applyStyle(view: UIView, radius: CGFloat = 20.0, shadowOpacity: Float = 0.2) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowRadius = 1.5
        view.layer.cornerRadius = radius
        view.layer.shadowOffset = .zero
    }
    
    public func buildInfo(data: MovieDetail){
        self.imgMovie.image = data.poster
        self.addInfoToStack(data: data)
        self.lbDescriptionTitle.isHidden = false
        self.lbDescription.text = data.overview
        
        let heightDescription = lbDescription.intrinsicContentSize.height
        lbDescription.heightAnchor.constraint(equalToConstant: heightDescription).isActive = true
        
        if let idVideo = data.trailerId{
            self.addTrailerView(idTrailer: idVideo)
        }
    }
    
    private func addInfoToStack(data: MovieDetail){
        
        for (_, x) in [["Título:", data.title ?? ""],
                      ["Fecha de estreno:", data.releaseDate ?? ""],
                      ["Idioma original:", data.originalLanguage ?? ""],
                      ["Puntuación:", "\(data.popularity ?? 0.0)"],
                      ["Genero:", data.genders ?? ""]].enumerated(){
            
            let view = UIView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            let title = UILabel(frame: .zero)
            title.textAlignment = .left
            title.minimumScaleFactor = 0.6
            title.adjustsFontSizeToFitWidth = true
            title.translatesAutoresizingMaskIntoConstraints = false
            title.text = x[0]
            title.font =  UIFont.boldSystemFont(ofSize: 16.0)
            title.textColor = ColorManager.fluorescentGreen
            
            let description = UILabel(frame: .zero)
            description.textAlignment = .left
            description.numberOfLines = 2
            description.minimumScaleFactor = 0.6
            description.adjustsFontSizeToFitWidth = true
            description.translatesAutoresizingMaskIntoConstraints = false
            description.text = x[1]
            description.font = UIFont.boldSystemFont(ofSize: 16.0)
            description.textColor = UIColor.white
            
            view.addSubview(title)
            view.addSubview(description)
            
            NSLayoutConstraint.activate([
                title.topAnchor.constraint(equalTo: view.topAnchor),
                title.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                title.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                description.topAnchor.constraint(equalTo: title.bottomAnchor),
                description.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                description.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                description.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
            
            if  x.last != "" {
                headerStack.addArrangedSubview(view)
            }
        }
    }
    
    func addTrailerView(idTrailer: String){
        trailerContainer.isHidden = false
        player = YTSwiftyPlayer(frame: CGRect.zero, playerVars: [.videoID(idTrailer)])
        player.translatesAutoresizingMaskIntoConstraints = false
        
        trailerContainer.addSubview(player)
        
        NSLayoutConstraint.activate([
            player.topAnchor.constraint(equalTo: trailerContainer.topAnchor, constant: 20.0),
            player.leadingAnchor.constraint(equalTo: trailerContainer.leadingAnchor, constant: 20.0),
            player.heightAnchor.constraint(equalToConstant: 250.0),
            player.trailingAnchor.constraint(equalTo: trailerContainer.trailingAnchor, constant: -20.0),
            player.bottomAnchor.constraint(equalTo: trailerContainer.bottomAnchor, constant: -30.0),
        ])
        
        player.autoplay = false
        player.loadPlayer()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.3) {
                self.trailerContainer.alpha = 1.0
            }
        }
    }
}
