//
//  Clinical.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 29/11/17.
//  Copyright © 2017 Vasant Indpro. All rights reserved.
//

import UIKit

fileprivate var BACKGROUND_COLOR_SELECTED: UIColor = .white
fileprivate var BACKGROUND_COLOR_UNSELECTED: UIColor = UIColor(rgbValue: 0xEFEFEF)

struct Clinical {
    
    var backgroundColor: UIColor = .clear
    var textColor: UIColor = .clear
    var borderColor: UIColor = .clear
    var image: UIImage = UIImage()
    
    init(_ assignmentTiming: AssignmentTiming, selected: Bool) {
        
        backgroundColor = selected ? BACKGROUND_COLOR_SELECTED : BACKGROUND_COLOR_UNSELECTED
        
        let color = assignmentTiming.color
        textColor = color
        borderColor = color
        
        image = assignmentTiming.shiftColorImage
    }
}
