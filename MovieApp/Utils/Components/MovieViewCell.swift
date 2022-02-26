//
//  MovieViewCell.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class MovieViewCell: UICollectionViewCell {
    
    private lazy var imgMovie: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var lbTitleMovie: UILabel = {
        let lb = UILabel()
        lb.textColor = ColorManager.fluorescentGreen
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.numberOfLines = 2
        lb.minimumScaleFactor = 0.6
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var horizontalContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lbDateMovie: UILabel = {
        let lb = UILabel()
        lb.textColor = ColorManager.fluorescentGreen
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.numberOfLines = 1
        lb.minimumScaleFactor = 0.6
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var imgScore: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "icon_star", in: Bundle.local, compatibleWith: nil)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var lbScoreMovie: UILabel = {
        let lb = UILabel()
        lb.textColor = ColorManager.fluorescentGreen
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        lb.numberOfLines = 1
        lb.minimumScaleFactor = 0.6
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var lbDescriptionMovie: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.white
        lb.font = UIFont.boldSystemFont(ofSize: 12)
        lb.numberOfLines = 4
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    public static var identifier = "MovieViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = ColorManager.greenForest
        
        buildUIComponents()
        buildConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyStyle(view: self)
        self.applyStyle(view: imgMovie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUIComponents() {
        horizontalContainer.addSubview(lbDateMovie)
        horizontalContainer.addSubview(imgScore)
        horizontalContainer.addSubview(lbScoreMovie)
        
        stackView.addArrangedSubview(lbTitleMovie)
        stackView.addArrangedSubview(horizontalContainer)
        stackView.addArrangedSubview(lbDescriptionMovie)
        
        self.contentView.addSubview(imgMovie)
        self.contentView.addSubview(stackView)
    }
    
    private func buildConstraints() {
        
        NSLayoutConstraint.activate([
            imgMovie.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imgMovie.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imgMovie.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.6),
            imgMovie.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            lbDateMovie.topAnchor.constraint(equalTo: horizontalContainer.topAnchor),
            lbDateMovie.leadingAnchor.constraint(equalTo: horizontalContainer.leadingAnchor),
            lbDateMovie.bottomAnchor.constraint(equalTo: horizontalContainer.bottomAnchor),
            
            imgScore.centerYAnchor.constraint(equalTo: horizontalContainer.centerYAnchor),
            imgScore.heightAnchor.constraint(equalToConstant: 10.0),
            imgScore.widthAnchor.constraint(equalToConstant: 10.0),
            imgScore.trailingAnchor.constraint(equalTo: lbScoreMovie.leadingAnchor, constant: -5.0),
            
            lbScoreMovie.topAnchor.constraint(equalTo: horizontalContainer.topAnchor),
            lbScoreMovie.trailingAnchor.constraint(equalTo: horizontalContainer.trailingAnchor),
            lbScoreMovie.bottomAnchor.constraint(equalTo: horizontalContainer.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: imgMovie.bottomAnchor, constant: 5.0),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10.0)
        ])
    }
    
    private func applyStyle(view: UIView, radius: CGFloat = 20.0, shadowOpacity: Float = 0.2) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowRadius = 1.5
        view.layer.cornerRadius = radius
        view.layer.shadowOffset = .zero
    }
    
    public func setMovieInfo(info: MovieTest){
        imgMovie.image = UIImage(named: info.img, in: Bundle.local, compatibleWith: nil)
        lbTitleMovie.text = info.name
        lbDescriptionMovie.text = info.description
        lbDateMovie.text = info.date
        lbScoreMovie.text = info.score
    }
}
