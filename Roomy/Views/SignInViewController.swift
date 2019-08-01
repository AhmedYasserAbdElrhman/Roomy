//
//  SignInViewController.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//
import NVActivityIndicatorView
import UIKit

class SignInViewController: UIViewController,NVActivityIndicatorViewable{
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func showHome(_ sender: Any) {
        if Connection.isConnected(){
            startAnimating( message: "Loading", type: NVActivityIndicatorType.ballRotateChase, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), fadeInAnimation: nil)
        guard let email = emailTF.text, !email.isEmpty else {return}
        guard let password = passwordTF.text, !password.isEmpty else {return}
        NetworkCall.login(email: email, password: password) { (error:Error?, success:Bool) in
            
            if success {
                self.performSegue(withIdentifier: "HomeView", sender: self)

            } else {
                 self.stopAnimating()
                let alert = UIAlertController(title: "Login Failed", message: "Please Try Again", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true ,completion: nil)
                
        }
    }
            
        } else {
                let alert = UIAlertController(title: "No Internet Connection",message: "Please Try Again Later",preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
        }
}
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toSignUpView(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUpView", sender: self)
    }
    
}
