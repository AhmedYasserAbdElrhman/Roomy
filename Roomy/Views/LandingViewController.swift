//
//  ViewController.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/12/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import RealmSwift
class LandingViewController: UIViewController {
    @IBAction func showLogin(_ sender: Any) {
    
        print(Realm.Configuration.defaultConfiguration.fileURL)
        self.performSegue(withIdentifier: "SignInView", sender: self)
        let realm = RealmServices.shared.realm

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


