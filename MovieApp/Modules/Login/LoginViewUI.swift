//
//  LoginViewUI.swift
//  MovieApp
//
//  Created by Gustavo Tellez on 25/02/22.
//

import UIKit

class LoginViewUI: UIView {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var imgLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon_movie", in: Bundle.local, compatibleWith: nil)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var txtUser: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username"
//        textfield.returnKeyType = .done
        textfield.autocorrectionType = .no
        textfield.keyboardType = .asciiCapable
        textfield.layer.cornerRadius = 8.0
        textfield.backgroundColor = UIColor.white
        textfield.font = UIFont.boldSystemFont(ofSize: 16.0)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var txtCredential: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
//        textfield.returnKeyType = .done
        textfield.autocorrectionType = .no
        textfield.keyboardType = .asciiCapable
        textfield.layer.cornerRadius = 8.0
        textfield.backgroundColor = UIColor.white
        textfield.font = UIFont.boldSystemFont(ofSize: 16.0)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var btnLogIn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Log in", for: .normal)
        btn.layer.cornerRadius = 3.0
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        btn.addTarget(self, action: #selector(btnLogInPressed), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var lbError: UILabel = {
        let lb = UILabel()
        lb.text = "Usuario invalido, algo ocurrio en la base de datos, intentalo más tarde"
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.textColor = ColorManager.lightRed
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    public weak var delegate: LoginViewProtocol?
    
    public convenience init(navigation: UINavigationController, delegate: LoginViewProtocol){
        self.init()
        self.delegate = delegate
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.addGestureRecognizer(tap)
        
        buildUIComponents()
        buildConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addVerticalGradient(topColor: ColorManager.lightGreen, bottomColor: ColorManager.darkGreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUIComponents(){
        
        txtUser.text = "a"
        txtCredential.text = "b"
        
        self.changeBtnLogInStatus(enable: true)
        
        stackView.addArrangedSubview(txtUser)
        stackView.addArrangedSubview(txtCredential)
        stackView.addArrangedSubview(btnLogIn)
        
        self.addSubview(imgLogo)
        self.addSubview(stackView)
        self.addSubview(lbError)
    }
    
    private func buildConstraints(){
        NSLayoutConstraint.activate([
            
            imgLogo.heightAnchor.constraint(equalToConstant: 80.0),
            imgLogo.widthAnchor.constraint(equalToConstant: 80.0),
            imgLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imgLogo.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -40.0),
            
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60.0),
            
            txtUser.heightAnchor.constraint(equalToConstant: 60.0),
            txtCredential.heightAnchor.constraint(equalToConstant: 60.0),
            btnLogIn.heightAnchor.constraint(equalToConstant: 60.0),
            
            lbError.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20.0),
            lbError.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            lbError.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.0)
        ])
    }
    
    @objc func hideKeyboard(){
        self.endEditing(true)
    }
    
    @objc func validateFields(){
        let usr = txtUser.text ?? ""
        let credential = txtCredential.text ?? ""
        
        if !usr.isEmpty && !credential.isEmpty{
            self.changeBtnLogInStatus(enable: true)
        }else{
            self.changeBtnLogInStatus(enable: false)
        }
    }
    
    @objc func btnLogInPressed(){
        let usr = txtUser.text ?? ""
        let credential = txtCredential.text ?? ""
        self.hideKeyboard()
        delegate?.notifyLogIn(usr: usr, credential: credential)
    }
    
    public func changeBtnLogInStatus(enable: Bool){
        if enable {
            btnLogIn.backgroundColor = ColorManager.fluorescentGreen
            btnLogIn.layer.shadowColor = ColorManager.shadow.cgColor
        }else{
            btnLogIn.backgroundColor = ColorManager.lightGray
            btnLogIn.layer.shadowColor = ColorManager.lightGray.cgColor
        }
        btnLogIn.isUserInteractionEnabled = enable
    }
}
