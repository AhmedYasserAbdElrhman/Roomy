//
//  RoundedButton.swift
//  Roomy
//
//  Created by Ahmed Yasser on 7/12/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var boorderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = boorderWidth
        }
    }
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}
