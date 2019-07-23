//
//  NetworkCalls.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/20/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class NetworkCall:NSObject {
    class func login (email:String,password:String, completion: @escaping (Error?,Bool) -> Void ){
        let paramters = ["email":email,"password":password]
        let url = URLS.loginURL
        Alamofire.request(url, method: .post, parameters: paramters, headers: nil) .validate() .responseJSON { respone in
            switch respone.response?.statusCode {
            case 401:
                completion(nil,false)
            case 200:
                let json = JSON(respone.result)
                Parser.parseLogin(from: json)
                completion(nil,true)
            default:
                break
            }
        }
        
    }
    class func signUp(name:String,email:String,password:String, completion: @escaping (Error?,Bool) ->Void){
        let paramters = ["name":name,"email":email,"password":password]
        Alamofire.request(URLS.registerURL, method: .post, parameters: paramters, headers: nil) .validate() .responseJSON{ response in
            switch response.result{
            case .failure(let error):
                completion(error,false)
            case .success(let value):
                completion(nil, true)
            }
        }
    }
}
