//
//  LoginViewController.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    let constants = Constants()
    var loginView = LoginView()
    
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let registerButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginView()
        
    }
}

extension LoginViewController{
    
    func setLoginView() {
        let mainView = LoginView(frame: self.view.frame)
        self.loginView = mainView
        self.view.addSubview(loginView)
        loginView.setUpView()
        self.loginView.loginAction = loginBtnTapped
        self.loginView.sighUpAction = sighnUpBtnTapped
        self.loginView.showPassAction = showPaswordBtnTapped
        
        
    }
}


extension LoginViewController: UITextFieldDelegate {
    
    func loginBtnTapped() {
        let mainVc = MatchesTableViewController()
        if let login = loginView.loginTextField.text, let password = loginView.passwordTextField.text {
            Auth.auth().signIn(withEmail: login, password: password) {  authResult, error in
                if let e = error{
                    print(e)
                }else {
                    self.navigationController?.pushViewController(mainVc, animated: true)
                    mainVc.modalPresentationStyle = .fullScreen
                }
            }
        }
    }
    
    
    func sighnUpBtnTapped() {
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
        registerVC.modalPresentationStyle = .currentContext
        print("it is ok")
    }
    
    func showPaswordBtnTapped() {
        
        let button = loginView.showPasswordBtn
        
        button.isSelected = !button.isSelected
        if button.isSelected {
            loginView.passwordTextField.isSecureTextEntry = false
            button.backgroundColor = constants.colorWhenSelected
        }else {
            loginView.passwordTextField.isSecureTextEntry = true
            button.backgroundColor = .gray
        }
        
        
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        title = "Fotball Express"
        self.view.addSubview(navBar)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loginView.self.endEditing(true)
    }
    

}
