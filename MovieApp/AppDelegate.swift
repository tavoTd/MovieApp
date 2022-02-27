//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit
import Firebase
import LGSideMenuController
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigation: UINavigationController?
    var sideMenuController = LGSideMenuController()
    var restrictRotation : UIInterfaceOrientationMask = .portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.restrictRotation
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        addObservers()
        setupKeyboard()
        openLoginModule()
        
        return true
    }
    
    private func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
    }
    
    private func addObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.notifyLogOut), name:  Notification.Name("NotificationLogout"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.notifyOpenHomeModule), name:  Notification.Name("NotificationOpenHome"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.notifyShowLeftMenu), name:  Notification.Name("NotificationShowLeftMenu"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.notifyDismissLeftMenu), name:  Notification.Name("NotificationDissmisLeftMenu"), object: nil)
    }
    
    @objc private func notifyLogOut(){
        do{
            try Auth.auth().signOut()
            self.openLoginModule()
            
        }catch let errorLogOut as NSError{
            print("Ocurrio un error: \(errorLogOut)")
        }
    }
    
    @objc private func notifyOpenHomeModule(){
        self.openHomeModule()
    }
    
    @objc private func notifyShowLeftMenu(){
        sideMenuController.showLeftView()
    }
    
    @objc private func notifyDismissLeftMenu(){
        sideMenuController.hideLeftView()
    }
    
    private func openLoginModule(){
        self.navigation = nil
        self.navigation = UINavigationController()
        self.navigation?.viewControllers.removeAll()
        self.navigation?.isNavigationBarHidden = true
        
        let view = LoginMain.createModule(navigation: self.navigation)
        
        self.navigation?.pushViewController(view, animated: false)
        self.navigation?.popToRootViewController(animated: false)
        
        setRootViewController(self.navigation)
    }
    
    private func openHomeModule(){
        navigation = nil
        navigation = UINavigationController()
        navigation?.isNavigationBarHidden = true
        
        let homeView = HomeMain.createModule(navigation: navigation)
        let menuView = SideMenuMain.createModule(navigation: self.navigation)
        
        self.navigation?.pushViewController(homeView, animated: false)
        self.navigation?.popToRootViewController(animated: false)
        
        sideMenuController = LGSideMenuController(rootViewController: navigation,
                                                  leftViewController: menuView)
        
        sideMenuController.rootViewLayerShadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2237358872)
        sideMenuController.rootViewLayerShadowRadius = 30
        sideMenuController.isLeftViewSwipeGestureEnabled = false
        sideMenuController.leftViewPresentationStyle = .scaleFromBig
        sideMenuController.leftViewBackgroundColor = ColorManager.darkBlue
        sideMenuController.leftViewWidth = (UIScreen.main.bounds.width * 0.6)
        setRootViewController(sideMenuController)
    }
    
    private func setRootViewController(_ vc: UIViewController?) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController  = nil
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
