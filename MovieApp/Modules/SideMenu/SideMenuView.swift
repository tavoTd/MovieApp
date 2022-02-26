//
//  SideMenuView.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

class SideMenuView: UIViewController {
    
    private var rootViewController: UIViewController? {
        get{
            if #available(iOS 13.0, *) {
                return UIApplication.shared.windows.first?.rootViewController
            } else {
                return UIApplication.shared.keyWindow!.rootViewController
            }
        }
    }
    
    private var ui: SideMenuViewUI?
    public var presenter: SideMenuPresenterProtocol?
    
    override func loadView() {
        ui = SideMenuViewUI(delegate: self)
        view = ui
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SideMenuView: SideMenuViewProtocol{
    
    func notifyOptionSelected(_ option: OptionMenu) {
        NotificationCenter.default.post(name: Notification.Name("NotificationDissmisLeftMenu"), object: nil)
        
        if option == .LogOut{
            self.showConfirmAlert()
        }else{
            presenter?.goToProfile()
        }
    }
    
    private func showConfirmAlert(){
        
        let alert = UIAlertController(title: "Información",
                                       message: "¿Deseas cerrar sesión?",
                                       preferredStyle: .alert)
        
        let actionAccept = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default) { action in
            NotificationCenter.default.post(name: Notification.Name("NotificationLogout"), object: nil)
        }
        
        let cancelOption = UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(actionAccept)
        alert.addAction(cancelOption)
        
        rootViewController?.present(alert, animated: true, completion: nil)
    }
}
