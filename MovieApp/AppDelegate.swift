//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigation: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        self.navigation = nil
        self.navigation = UINavigationController()
        self.navigation?.viewControllers.removeAll()
        self.navigation?.isNavigationBarHidden = true
        
        let view = LoginMain.createModule(navigation: self.navigation)
        
        self.navigation?.pushViewController(view, animated: false)
        self.navigation?.popToRootViewController(animated: false)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController  = nil
        window?.rootViewController = self.navigation
        window?.makeKeyAndVisible()
        
        return true
    }
}
