//
//  OptionMenuViewCell.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class OptionMenuViewCell: UITableViewCell {
    
    public lazy var imgOption: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    public lazy var lbOption: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.white
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.numberOfLines = 1
        lb.minimumScaleFactor = 0.6
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    public static var identifier = "OptionMenuViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        buildUIComponents()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUIComponents() {
        self.contentView.addSubview(imgOption)
        self.contentView.addSubview(lbOption)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            
            imgOption.heightAnchor.constraint(equalToConstant: 30.0),
            imgOption.widthAnchor.constraint(equalToConstant: 30.0),
            imgOption.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0),
            imgOption.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            lbOption.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            lbOption.leadingAnchor.constraint(equalTo: imgOption.trailingAnchor, constant: 10.0)
        ])
    }
}
