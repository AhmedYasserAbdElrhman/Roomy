//
//  Room.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import UIKit

class Room : NSObject{
    var id : Int = 0
    var image:[UIImage] = [UIImage]()
    var adress:String = ""
    var stateAdress:String = ""
    var price:String = ""
    var info:String = ""
    var descriptionText: String = ""
    var descriptionPic: UIImage = UIImage(named: "Placeholder")!
    var descriptionL: String = ""
    /*init(image:[UIImage],adress:String,cityAdress:String,price:String,info:String) {
        self.image=image
        self.adress=adress
        self.stateAdress=cityAdress
        self.price="$\(price)"
        self.info=info
        
    }*/
}
