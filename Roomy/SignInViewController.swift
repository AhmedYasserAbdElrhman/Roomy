//
//  SignInViewController.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController{
    
    @IBAction func showHome(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
