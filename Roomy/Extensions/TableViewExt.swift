//
//  TableViewExt.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/24/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import UIKit
extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
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
