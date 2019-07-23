//
//  NetworkRoute.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/22/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import Alamofire
enum NetworkRoute :URLRequestConvertible {
    case login([String: Any])
    case register([String: Any])
    case getRooms([String: Any])
    case addRoom([String: Any])
 
    func asURLRequest() throws -> URLRequest {
        var method : HTTPMethod {
            switch self {
            case .login , .addRoom , .register :
                return .post
            case .getRooms:
                return .get
                
            }
        }
        let parameters : ([String: Any]?) = {
            switch self {
            case .login(let para) , .addRoom(let para) , .register(let para):
                return para
            case .getRooms:
                return nil
            }
        }()
        
        let url : URL = {
            let destURL : String?
            switch  self {
            case .login:
                destURL = URLS.loginURL
            case .register:
                destURL = URLS.registerURL
            case .getRooms, .addRoom:
                destURL = URLS.roomsURL
            
            }
            var url : URL!
            if let destURL = destURL {
                url = URL(string: destURL)
            }
            return url

    }()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        let encoding : ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: parameters)

 }
    
}
