//
//  Room.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/15/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Room : Object {
    var id : Int = 0
    var image:String = ""
    var adress:String = ""
    var stateAdress:String = ""
    var price:String = ""
    var info:String = ""
    var descriptionText: String = "2 bed 1 bath"
    var descriptionPic: UIImage = UIImage(named: "Placeholder")!
    var descriptionL: String = ""
}
