//
//  LoaderView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 27/02/22.
//

import UIKit

class LoaderView{
    
    private static let tagView = 99
    
    public static func show(parent: UIView) {
        if parent.viewWithTag(tagView) != nil {
            return
        }
        
        let mainView = UIView(frame: parent.frame)
        mainView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainView.tag = tagView
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = parent.center
        activityIndicator.startAnimating()
        mainView.addSubview(activityIndicator)
        parent.addSubview(mainView)
    }
    
    public static func dismiss(parent: UIView) {
        if let loaderView = parent.viewWithTag(tagView) {
            loaderView.removeFromSuperview()
        }
    }
}
