//
//  SideMenuViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 26/02/22.
//

import UIKit

enum OptionMenu: String{
    case Profile  = "Profile"
    case LogOut   = "LogOut"
}

class SideMenuViewUI: UIView {
    
    private lazy var tblOptions: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.backgroundColor = UIColor.clear
        tableview.isScrollEnabled = false
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(OptionMenuViewCell.self, forCellReuseIdentifier: OptionMenuViewCell.identifier)
        return tableview
    }()
    
    private let options : [OptionMenu] = [.Profile, .LogOut]
    
    public weak var delegate: SideMenuViewProtocol?
    
    public convenience init(delegate: SideMenuViewProtocol){
        self.init()
        self.delegate = delegate
        self.backgroundColor = ColorManager.darkBlue
        
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
        self.addSubview(tblOptions)
    }
    
    private func buildConstraints(){
        let marginTop = self.getStatusBarHeight() + 40.0
        
        NSLayoutConstraint.activate([
            tblOptions.topAnchor.constraint(equalTo: self.topAnchor, constant: marginTop),
            tblOptions.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tblOptions.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tblOptions.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
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
}

extension SideMenuViewUI: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OptionMenuViewCell.identifier) as! OptionMenuViewCell
        
        let optionMenu = options[indexPath.row]

        cell.lbOption.text = optionMenu.rawValue
        
        switch optionMenu{
        case .Profile:
            cell.imgOption.image = UIImage(named: "icon_profile", in: Bundle.local, compatibleWith: nil)
            break
            
        case .LogOut:
            cell.imgOption.image = UIImage(named: "icon_logOut", in: Bundle.local, compatibleWith: nil)
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.notifyOptionSelected(options[indexPath.row])
    }
}
