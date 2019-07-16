//
//  RoomCell.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    
    @IBOutlet weak var hotelAddress: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    @IBOutlet weak var roomSatate: UILabel!
    @IBOutlet weak var roomInfo: UILabel!
    @IBOutlet weak var roomImage1: UIImageView!
    @IBOutlet weak var roomImage2: UIImageView!
    @IBOutlet weak var roomImage3: UIImageView!
    func setCell(cell:Room){
        hotelAddress.text = cell.adress
        roomPrice.text = cell.price
        roomSatate.text = cell.stateAdress
        roomInfo.text = cell.info
        roomImage1.image = cell.image[0]
        roomImage2.image = cell.image[1]
        roomImage3.image = cell.image[2]
        
    }
    
}
