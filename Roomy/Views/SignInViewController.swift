//
//  SignInViewController.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController{
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func showHome(_ sender: Any) {
        guard let email = emailTF.text, !email.isEmpty else {return}
        guard let password = passwordTF.text, !password.isEmpty else {return}
        NetworkCall.login(email: email, password: password) { (error:Error?, success:Bool) in
            
            if success {
                self.performSegue(withIdentifier: "HomeView", sender: self)

            }
            else {
                let alert = UIAlertController(title: "Login Failed", message: "Please Try Again", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true ,completion: nil)
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toSignUpView(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUpView", sender: self)
    }
    
}
