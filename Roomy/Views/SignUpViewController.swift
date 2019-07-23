//
//  SignUpViewController.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/20/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    @IBAction func signUpButtonAction(_ sender: Any) {
        guard let name = userNameTF.text?.trimmed, !name.isEmpty, let email = emailTF.text?.trimmed, !email.isEmpty,  let password = passwordTF.text?.trimmed, !password.isEmpty else {return}
        NetworkCall.signUp(name: name, email: email, password: password) { (error:Error?, success:Bool) in
            if success {
                let alert = UIAlertController(title: "Success", message: "Congrats You Have Created Your Account", preferredStyle: .alert)
                let action = UIAlertAction(title: "Login Now", style: .default, handler: { action in
                    self.performSegue(withIdentifier: "SignInView", sender: self)
                })
                alert.addAction(action)
                self.present(alert, animated: true ,completion: nil)

            
            }
            else {
                let alert = UIAlertController(title: "Failed", message: "Please Try Again", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true ,completion: nil)
            }
    
}
    
}
    
}
