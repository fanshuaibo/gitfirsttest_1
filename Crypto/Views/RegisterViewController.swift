//
//  RegisterViewController.swift
//  Crypto
//
//  Created by Raiymbek Duldyiev on 23.05.2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { _ , error in
                if let e = error {
                    print(e.localizedDescription.description)
                } else {
                    self.performSegue(withIdentifier: "goToMain1", sender: self)
                }
            }
        }
    }
    
}
