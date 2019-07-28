//
//  RoomCell.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import Kingfisher

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
        if let url = URL(string:cell.image){
        roomImage1.kf.setImage(with : url, placeholder: UIImage(named: "Placeholder"),options: [.transition(ImageTransition.flipFromBottom(0.5))])
        roomImage2.kf.setImage(with: url, placeholder: UIImage(named: "Placeholder"),options: [.transition(ImageTransition.flipFromBottom(0.5))])
        roomImage3.kf.setImage(with : url, placeholder: UIImage(named: "Placeholder"),options: [.transition(ImageTransition.flipFromBottom(0.5))])
        }
    }
}

