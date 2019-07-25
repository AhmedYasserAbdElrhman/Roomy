//
//  HomeViewController.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController{
    var hotelAdress = ["35 Pierrepont St #C7","86 Gerrymain Rd #F3","22 Yonker St #B4","90 Simmons Rd #M3"]
    var stateAdress = ["Brooklyn, NY 11236","NewYork, NY 11253","Queens, NY 11539","Brooklyn, NY 11236"]
    var info = ["2 bed 1 bath","1 bed 1 bath","3 bed 2 bath","2 bed 1 bath"]
    var price = ["2500","1250","4200","2700"]
    var images:[[UIImage]] = [[UIImage(named: "room1_1.png")!,UIImage(named: "room1_2.png")!,UIImage(named: "room1_3.png")!],[UIImage(named: "room1_1.png")!,UIImage(named: "room1_2.png")!,UIImage(named: "room1_3.png")!],[UIImage(named: "room1_1.png")!,UIImage(named: "room1_2.png")!,UIImage(named: "room1_3.png")!],[UIImage(named: "room1_1.png")!,UIImage(named: "room1_2.png")!,UIImage(named: "room1_3.png")!]]
    var rooms:[Room] = []
    
    @IBOutlet weak var tableO: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        if Connection.isConnected() {
            FetchRooms.getRoomsInBackend { (error, rooms) in
                if let rooms = rooms {
                    self.rooms = rooms
                }
            }
        }
        else {
            FetchRooms.getRoomsInDB { (error, rooms) in
                if let rooms = rooms {
                    self.rooms = rooms
                }

        }
    }
}
    override func viewDidLoad() {
        super.viewDidLoad()
        super.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.navigationController?.isNavigationBarHidden = false
    }
    func creatArray() -> [Roominit]
    {
        var tempCell : [Roominit] = []
        for i in 0...3 {
            let cell = Roominit.init(image: images[i], adress: hotelAdress[i], cityAdress: stateAdress[i], price: price[i], info: info[i])
            tempCell.append(cell)
        }
        return tempCell
    }
    
}

