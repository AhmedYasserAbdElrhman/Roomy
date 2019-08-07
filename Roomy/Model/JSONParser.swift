//
//  JSONParser.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/23/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import SwiftyJSON

class Parser:NSObject {
    class func parseLogin(from value :JSON){
        if let api = value["auth_token"].string {
            let session = UserDefaults.standard
            session.set(api, forKey: "auth_token")
        }
    }
    
    class func parseRooms(from value : [JSON])->[Room]!{
        var rooms = [Room]()
        for reply in value{
            guard let reply = reply.dictionary else {return nil}
            let room = Room()
            room.id = reply["id"]?.int ?? 0
            room.adress = reply["title"]?.string ?? ""
            room.price = reply["price"]?.string ?? "0"
            room.stateAdress = reply["place"]?.string ?? ""
            room.descriptionL = reply["image"]?.string ?? ""
            rooms.append(room)
            RealmServices.shared.addDB(room: room)
    }
    return rooms

}

}
