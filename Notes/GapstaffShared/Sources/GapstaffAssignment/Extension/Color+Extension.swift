//
//  GSExtensions.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 08/11/17.
//  Copyright © 2017 Vasant Indpro. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    convenience init(rgbString: String) {
        
        var hexString = rgbString
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if let rgbValue = UInt(hexString, radix: 16) {
            let red   =  CGFloat((rgbValue >> 16) & 0xff) / 255
            let green =  CGFloat((rgbValue >>  8) & 0xff) / 255
            let blue  =  CGFloat((rgbValue) & 0xff) / 255
            
            self.init(red: red, green: green, blue: blue, alpha: 1.0)
        }
        else {
            self.init()
        }
    }
    
    convenience init(rgbValue: UInt) {
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
