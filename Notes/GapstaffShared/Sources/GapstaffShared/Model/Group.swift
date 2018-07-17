//
//  Group.swift
//  GapstaffShared
//
//  Created by Vasant Hugar on 17/07/18.
//

import UIKit

struct Group {
    
    var dayAssignments = [DayAssignment]()
    
    init(_ dictionary: [String: Any]) {
        
        if let dayAssignments = dictionary["dayAssignments"] as? [[String : Any]] {
            for dayAssignment in dayAssignments {
                self.dayAssignments.append(DayAssignment(dayAssignment))
            }
        }
    }
}
