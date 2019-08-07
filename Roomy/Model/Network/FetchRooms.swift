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
        let parsRooms = Parser.parseRooms(from: JSON(dbRooms).array!)
        completion(nil,parsRooms)
    }
    
    
}
