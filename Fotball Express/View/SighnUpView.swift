//
//  SighnUpView.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit

class SighnUpView: UIView {

    var createAccountAction:(() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        backgroundColor = Constants().viewBackgroundColor
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(createAccoutBtn)
//        addSubview(textLabel)
        setEmailTextField()
        setPswrdTextField()
        setCreateAccBtn()
//        setTextLabel()
        
    }
    
    let emailTextField:UITextField = {
        let email = LoginView().loginTextField
        email.placeholder = " Enter Email"
        email.delegate = keyboardWillHideNotification as? UITextFieldDelegate

        return email
    }()
    
    func setEmailTextField() {
        emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant:300).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant:50).isActive = true
    }
    
    
    let passwordTextField:UITextField = {
        let pswrd = LoginView().passwordTextField
        pswrd.placeholder = " Enter Password"
        pswrd.isSecureTextEntry = false
        pswrd.delegate = keyboardWillHideNotification as? UITextFieldDelegate
        
        return pswrd
    }()
    
    func setPswrdTextField() {
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant:300).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant:50).isActive = true
    }

    let createAccoutBtn:UIButton = {
        let createAccount = UIButton()
        createAccount.backgroundColor = Constants().colorWhenSelected
        createAccount.translatesAutoresizingMaskIntoConstraints = false
        createAccount.setTitle("Create Account", for: .normal)
        createAccount.layer.cornerRadius = 10
        createAccount.addTarget(self, action: #selector(createAccountBtnTapped), for: .touchUpInside)
        
        return createAccount
        
    }()
    
        func setCreateAccBtn() {

            createAccoutBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
            createAccoutBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            createAccoutBtn.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor).isActive = true
            createAccoutBtn.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor).isActive = true
        }
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont(name: "San Francisco", size: 40)
        
        return label
    }()
    
    func setTextLabel() {
        textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 50).isActive = true
        createAccoutBtn.widthAnchor.constraint(equalToConstant: 320).isActive = true
        createAccoutBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func createAccountBtnTapped() {
        createAccountAction?()
    }

}
