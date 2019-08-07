//
//  HomeViewController.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import RealmSwift


class HomeViewController: UIViewController{
    var rooms:[Room] = []
    
    @IBOutlet weak var tableO: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = RealmServices.shared.realm
        self.navigationController?.isNavigationBarHidden = false
        if Connection.isConnected() {
            FetchRooms.getRoomsInBackend { (error, rooms) in
                if let rooms = rooms {
                    self.rooms = rooms
                    self.tableO.reloadData()
                }
            }
        }
        else {
            FetchRooms.getRoomsInDB { (error, rooms) in
                if let rooms = rooms {
                    self.rooms = rooms
                    self.tableO.reloadData()
                }

        }
    }
}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logoutalert)), animated: true)

    }

    @objc private func logoutalert(){
        let alert = UIAlertController(title: "Logout", message: "Are You Sure !", preferredStyle: .alert)
        let button1 = UIAlertAction(title: "Yes", style: .default, handler: { action in self.logOutButton()})
        let button2 = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(button1)
        alert.addAction(button2)
        present(alert, animated: true, completion: nil)
        
    }
    func logOutButton(){
        UserDefaults.standard.removeObject(forKey: "auth_token")
        let start = UIStoryboard(name: "Main",  bundle: nil).instantiateViewController(withIdentifier: "Landing")
        present(start, animated: true)
    }

}

