//
//  AssignmentTiming.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 08/11/17.
//  Copyright © 2017 Vasant Indpro. All rights reserved.
//

import UIKit

class AssignmentTiming: NSObject {
    
    var type: ShiftType = .NONE
    
    var start = ""
    
    var end = ""
    
    var color: UIColor = .black
    
    var requiredStaff = [Any]()
    
    override init() {
        super.init()
    }
    
    init(_ dictionary: [String: Any]) {
        
        if let color = dictionary["color"] as? String {
            self.color = UIColor(rgbString: color)
        }
        
        if let start = dictionary["start"] as? String {
            self.start = start
        }
        
        if let end = dictionary["end"] as? String {
            self.end = end
        }
        
        if let type = dictionary["type"] as? String {
            self.type = ShiftType(rawValue: type)!
        }
        
        if let requiredStaff = dictionary["requiredStaff"] as? [Any] {
            self.requiredStaff = requiredStaff
        }
    }
}

extension AssignmentTiming { // Images
    
    var whiteImage: UIImage {
        switch type {
        case .DAY_ASSIGNMENT:
            return #imageLiteral(resourceName: "sun_white")
            
        case .EVENING_ASSIGNMENT:
            return #imageLiteral(resourceName: "evening_white")
            
        case .NIGHT_ASSIGNMENT:
            return #imageLiteral(resourceName: "moon_white")
            
        default:
            return UIImage()
        }
    }
    
    var shiftColorImage: UIImage {
        switch type {
        case .DAY_ASSIGNMENT:
            return #imageLiteral(resourceName: "sun_blue")
            
        case .EVENING_ASSIGNMENT:
            return #imageLiteral(resourceName: "evening_blue")
            
        case .NIGHT_ASSIGNMENT:
            return #imageLiteral(resourceName: "moon_blue")
            
        default:
            return UIImage()
        }
    }
    
    var greenImage: UIImage {
        switch type {
        case .DAY_ASSIGNMENT:
            return #imageLiteral(resourceName: "sun_green")
            
        case .EVENING_ASSIGNMENT:
            return #imageLiteral(resourceName: "evening_green")
            
        case .NIGHT_ASSIGNMENT:
            return #imageLiteral(resourceName: "moon_green")
            
        default:
            return UIImage()
        }
    }
    
    var grayImage: UIImage {
        switch type {
        case .DAY_ASSIGNMENT:
            return #imageLiteral(resourceName: "sun_grey")
            
        case .EVENING_ASSIGNMENT:
            return #imageLiteral(resourceName: "evening_gray")
            
        case .NIGHT_ASSIGNMENT:
            return #imageLiteral(resourceName: "moon_gray")
            
        default:
            return UIImage()
        }
    }
}
