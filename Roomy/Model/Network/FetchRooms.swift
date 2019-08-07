//
//  FetchRooms.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/25/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class FetchRooms : NSObject {
    class func getRoomsInBackend ( completion: @escaping (Error?,[Room]?) -> Void ) {
        guard let tokens = UserDefaults.standard.object(forKey: "auth_token") as? String else {
            completion(nil,nil)
            return
        }
        Alamofire.request(NetworkRoute.getRooms) .validate() .responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                guard let rooms = Parser.parseRooms(from: JSON(value).array!) else {
                    completion(nil,nil)
                    return
                }
                completion(nil,rooms)
            }
        }
    }
    
    class func getRoomsInDB( completion : @escaping (Error?,[Room]?) -> Void ){
      let dbRooms = RealmServices.shared.readAllRooms()
      let value = JSON(dbRooms).array!
      var rooms = [Room]()
      for reply in value{
        guard let reply = reply.dictionary else { return }
        let room = Room()
        room.id = reply["id"]?.int ?? 0
        room.adress = reply["title"]?.string ?? ""
        room.price = reply["price"]?.string ?? "0"
        room.stateAdress = reply["place"]?.string ?? ""
        room.descriptionL = reply["image"]?.string ?? ""
        rooms.append(room)
    }
      completion(nil,rooms)
  }
}
