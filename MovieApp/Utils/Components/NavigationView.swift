//
//  NavigationView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class NavigationView: UIView {
    
    public lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var btnLeft: UIButton = {
        let btn = UIButton()
        btn.isHidden = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.imageEdgeInsets = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
        return btn
    }()
    
    private lazy var lbTitle: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.numberOfLines = 2
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var btnRight: UIButton = {
        let btn = UIButton()
        btn.isHidden = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.imageEdgeInsets = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
        return btn
    }()
    
    private var navigation: UINavigationController?

    public init(){
        super.init(frame: CGRect.zero)
        
        buildUIComponents()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUIComponents(){
        
        containerView.addSubview(btnLeft)
        containerView.addSubview(lbTitle)
        containerView.addSubview(btnRight)
        
        self.addSubview(containerView)
    }
    
    private func buildConstraints(){
        let topMargin = getStatusBarHeight()
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: topMargin),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 60.0),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            btnLeft.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10.0),
            btnLeft.heightAnchor.constraint(equalToConstant: 40.0),
            btnLeft.widthAnchor.constraint(equalToConstant: 40.0),
            btnLeft.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            lbTitle.leadingAnchor.constraint(equalTo: btnLeft.trailingAnchor),
            lbTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            lbTitle.trailingAnchor.constraint(equalTo: btnRight.leadingAnchor),
            
            btnRight.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10.0),
            btnRight.heightAnchor.constraint(equalToConstant: 40.0),
            btnRight.widthAnchor.constraint(equalToConstant: 40.0),
            btnRight.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
    
    public func configComponents(navigation: UINavigationController?,
                                title: String,
                                titleColor: UIColor = UIColor.white,
                                titleFont: UIFont  = UIFont.boldSystemFont(ofSize: 20.0),
                                backgroundColor: UIColor = ColorManager.darkGray,
                                iconLeftButton: String? = "icon_leftArrow",
                                iconRightButton: String? = nil){
        
        self.navigation = navigation
        self.backgroundColor = backgroundColor
        
        lbTitle.text = title
        lbTitle.textColor = titleColor
        lbTitle.font = titleFont
        
        if let iconLeft = iconLeftButton{
            btnLeft.isHidden = false
            btnLeft.setImage(UIImage(named: iconLeft, in: Bundle.local, compatibleWith: nil), for: .normal)
            btnLeft.setImage(UIImage(named: iconLeft, in: Bundle.local, compatibleWith: nil), for: .highlighted)
            btnLeft.addTarget(self, action: #selector(popNavigationController), for: .touchUpInside)
        }
        
        if let iconRight = iconRightButton{
            btnRight.isHidden = false
            btnRight.setImage(UIImage(named: iconRight, in: Bundle.local, compatibleWith: nil), for: .normal)
            btnRight.setImage(UIImage(named: iconRight, in: Bundle.local, compatibleWith: nil), for: .highlighted)
            btnRight.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        }
    }
    
    private func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    @objc func popNavigationController(){
        if let nav = self.navigation {
            nav.popViewController(animated: true)
        }else {
            print("Navigation controller not assigned")
        }
    }
    
    @objc func openMenu(){
        print("presiono el boton del menu")
    }
}
