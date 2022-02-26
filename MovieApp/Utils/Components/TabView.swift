//
//  TabView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

public enum TabViewStatus{
    case Selected
    case Deselected
}

class TabView: UIView {
    
    private lazy var lbTitle: UILabel = {
        let  lb = UILabel()
        lb.numberOfLines = 1
        lb.textAlignment = .center
        lb.minimumScaleFactor = 0.6
        lb.adjustsFontSizeToFitWidth = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private var contentColorEnabled     :   UIColor?
    private var contentColorDisabled    :   UIColor?
    private var fontEnabled             :   UIFont?
    private var fontDisabled            :   UIFont?
    private var backgroundColorEnabled  :   UIColor?
    private var backgroundColorDisabled :   UIColor?

    public init(title: String,
                fontEnabled: UIFont = UIFont.boldSystemFont(ofSize: 16.0),
                fontDisabled: UIFont = UIFont.systemFont(ofSize: 16.0),
                contentColorEnabled: UIColor = UIColor.white,
                contentColorDisabled: UIColor = UIColor.white,
                backgroundColorEnabled: UIColor = ColorManager.oxfordGray,
                backgroundColorDisabled: UIColor = UIColor.clear,
                radius: CGFloat = 8.0,
                height: CGFloat = 40.0,
                status: TabViewStatus = .Deselected){
        
        super.init(frame: CGRect.zero)
        
        self.layer.cornerRadius = radius
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.buildUIElements(title: title,
                             fontEnabled: fontEnabled,
                             fontDisabled: fontDisabled,
                             contentColorEnabled: contentColorEnabled,
                             contentColorDisabled: contentColorDisabled,
                             backgroundColorEnabled: backgroundColorEnabled,
                             backgroundColorDisabled: backgroundColorDisabled)
        
        self.buildContraints(height: height)
        self.setTabStatus(status)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUIElements(title: String,
                                 fontEnabled: UIFont,
                                 fontDisabled: UIFont,
                                 contentColorEnabled: UIColor,
                                 contentColorDisabled: UIColor,
                                 backgroundColorEnabled: UIColor,
                                 backgroundColorDisabled: UIColor){
        
        self.contentColorEnabled        =   contentColorEnabled
        self.contentColorDisabled       =   contentColorDisabled
        self.fontEnabled                =   fontEnabled
        self.fontDisabled               =   fontDisabled
        self.backgroundColorEnabled     =   backgroundColorEnabled
        self.backgroundColorDisabled    =   backgroundColorDisabled
        
        lbTitle.text = title
        
        self.addSubview(lbTitle)
    }
    
    private func buildContraints(height: CGFloat){
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: height),
            
            lbTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lbTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            lbTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            lbTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    public func setTabStatus(_ status: TabViewStatus){
        
        self.lbTitle.font = status == .Selected ? self.fontEnabled : self.fontDisabled
        self.lbTitle.textColor = status == .Selected ? self.contentColorEnabled : self.contentColorDisabled
        self.backgroundColor = status == .Selected ? self.backgroundColorEnabled : self.backgroundColorDisabled
    }
}
