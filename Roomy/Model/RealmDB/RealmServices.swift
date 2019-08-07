//
//  RealmServices.swift
//  Roomy
//
//  Created by Ahmed Yasser on 8/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import RealmSwift

class RealmServices{
    private init() {}

    static let shared = RealmServices()
    var realm = try! Realm()
    
    
    func addDB (room : Room){
        let realm = try! Realm()
        try! realm.write {
            let realmRoom = roomsOFFline()
            realmRoom.id = room.id
            realmRoom.adress = room.adress
            realmRoom.stateAdress = room.stateAdress
            realmRoom.image = room.image
            realmRoom.price = room.price
            realmRoom.info = room.info
            realmRoom.descriptionText = room.descriptionText
            realmRoom.descriptionL = room.descriptionL
            realm.add(realmRoom)
        }
    }
    
    func readAllRooms() -> Results<roomsOFFline> {
        let realm = try! Realm()
        let rooms = realm.objects(roomsOFFline.self)
        return rooms
    }

}
