//
//  String.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/22/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
extension String {
    var trimmed:String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
}
}
