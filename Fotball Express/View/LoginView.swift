//
//  LoginView.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit



import UIKit
import FirebaseAuth

class LoginView: UIView {
    
    var loginAction: (() -> Void)?
    var sighUpAction: (() -> Void)?
    var showPassAction: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpView() {
        backgroundColor = Constants().viewBackgroundColor
        
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(sighnUPButton)
        addSubview(showPasswordBtn)
        
        setUpLoginTxtField()
        setUpPasswordTextField()
        setUpLoginBtn()
        setSighnUpButton()
        setShowPasswordBtn()
        
    }
    
    
    
    
    let loginTextField:UITextField = {
        let login = UITextField()
        login.backgroundColor = .systemGray
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "Login"
        login.text = "1@2.com"
        login.textAlignment = .center
        login.layer.cornerRadius = 10
        login.keyboardType = .emailAddress
        login.returnKeyType = .next
        login.autocorrectionType = .no
        login.delegate = LoginViewController.keyboardWillHideNotification as? UITextFieldDelegate
        
        return login
    }()
    
    let passwordTextField:UITextField = {
        let password = UITextField()
        password.backgroundColor = .systemGray
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Password"
        password.text = "123456"
        password.textAlignment = .center
        password.layer.cornerRadius = 10
        password.keyboardType = .alphabet
        password.returnKeyType = .done
        password.isSecureTextEntry = true
        password.autocorrectionType = .no
        password.delegate = LoginViewController.keyboardWillHideNotification as? UITextFieldDelegate
        
        return password
    }()
    
    let loginButton: UIButton = {
        let logBtn = UIButton()
        logBtn.backgroundColor = Constants().colorWhenSelected
        logBtn.translatesAutoresizingMaskIntoConstraints = false
        logBtn.setTitle("Login", for: .normal)
        logBtn.layer.cornerRadius = 10
        logBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        
        return logBtn
    }()
    
    let sighnUPButton: UIButton = {
        let signUp = UIButton()
        signUp.backgroundColor = Constants().colorWhenSelected
        signUp.translatesAutoresizingMaskIntoConstraints = false
        signUp.setTitle("Sign Up", for: .normal)
        signUp.layer.cornerRadius = 10
        signUp.addTarget(self, action: #selector(registerBtnTapped), for: .touchUpInside)
        
        return signUp
    }()
    
    let showPasswordBtn: UIButton = {
        let showPassBtn = UIButton()
        showPassBtn.translatesAutoresizingMaskIntoConstraints = false
        showPassBtn.backgroundColor = .gray
        showPassBtn.setTitle("Eye", for: .normal)
        showPassBtn.titleLabel?.font = UIFont(name: "San Francisco", size: 5)
        showPassBtn.layer.cornerRadius = 10
        showPassBtn.addTarget(self, action: #selector(showPassBtnTapped), for: .touchUpInside)
        
        return showPassBtn
        
    }()
    
    func setUpLoginTxtField() {
        loginTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant:300).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant:50).isActive = true
        
    }
    
    func setUpPasswordTextField() {
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant:300).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant:50).isActive = true
    }
    
    func setUpLoginBtn(){
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant:150).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant:50).isActive = true
        
    }
    
    func setSighnUpButton() {
        sighnUPButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        sighnUPButton.leftAnchor.constraint(equalTo: loginButton.rightAnchor, constant: 10).isActive = true
        sighnUPButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        sighnUPButton.widthAnchor.constraint(equalToConstant:150).isActive = true
        sighnUPButton.heightAnchor.constraint(equalToConstant:50).isActive = true
    }
    
    func setShowPasswordBtn() {
        showPasswordBtn.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        showPasswordBtn.leftAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 5).isActive = true
        showPasswordBtn.widthAnchor.constraint(equalToConstant:30).isActive = true
        showPasswordBtn.heightAnchor.constraint(equalToConstant:50).isActive = true
    }
    
    @objc func loginBtnTapped() {
        loginAction?()
    }
    
    @objc func registerBtnTapped() {
        sighUpAction?()
    }
    
    @objc func showPassBtnTapped() {
        showPassAction?()
    }
    
}

