//
//  RealmDB.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/25/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//
import UIKit
import Foundation
import RealmSwift

class roomsOFFline : Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var image:String = ""
    @objc dynamic var adress:String = ""
    @objc dynamic var stateAdress:String = ""
    @objc dynamic var price:String = ""
    @objc dynamic var info:String = ""
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var descriptionPic: UIImage = UIImage(named: "Placeholder")!
    @objc dynamic var descriptionL: String = ""
    
//    override static func primaryKey() -> String? {
//        return "id"
//    }
    

}
