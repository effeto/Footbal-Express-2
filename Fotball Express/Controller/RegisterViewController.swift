//
//  RegisterViewController.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    var createAccView = SighnUpView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        
    }
    
    func setView() {
        let mainView = SighnUpView(frame: self.view.frame)
        self.createAccView = mainView
        self.view.addSubview(createAccView)
        createAccView.setUpView()
        self.createAccView.createAccountAction = createAccountBtnTapped

    }
    func createAccountBtnTapped() {
        if let email = createAccView.emailTextField.text, let password = createAccView.passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print (e)
                }else {
                    let matchesVc = MatchesTableViewController()
                    self.navigationController?.pushViewController(matchesVc, animated: true)
                    matchesVc.modalPresentationStyle = .currentContext
                }
            }
        }
   }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        createAccView.self.endEditing(true)
    }

}
