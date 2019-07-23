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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        rooms = creatArray()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    func creatArray() -> [Room]
    {
        var tempCell : [Room] = []
        for i in 0...3 {
            let cell = Room.init(image: images[i], adress: hotelAdress[i], cityAdress: stateAdress[i], price: price[i], info: info[i])
            tempCell.append(cell)
        }
        return tempCell
    }
    
}
extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = rooms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as! RoomCell
        cell.setCell(cell: room)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DescriptionView", sender: self)
    }
}

