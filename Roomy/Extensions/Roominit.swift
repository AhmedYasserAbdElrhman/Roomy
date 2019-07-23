//
//  Roominit.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/23/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//
import UIKit
import Foundation

class Roominit : Room {
    convenience init(image: [UIImage], adress: String, cityAdress: String, price: String, info: String) {
        self.init()
        super.image=image
        super.adress=adress
        super.stateAdress=cityAdress
        super.price="$\(price)"
        super.info=info

    }
    
}
