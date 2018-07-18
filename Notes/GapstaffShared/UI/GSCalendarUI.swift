//
//  GSCalendarUI.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 03/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

enum GSCalendarDesignType {
    case noAssignment
    case cancelled
    case shift
    case withImage
    case withoutImage
}

class GSCalendarUI: NSObject {
    
    static func makeDesign(date: Date,
                           selected: Bool,
                           assignments: [GSAssignment]) -> GSCalendarUIComponents {
        
        // Sort the Selected Assignments
        let sortedAssignments = AssignmentFilter.filter(assignments)
        
        var statuses = Set<GSAssignmentStatus>()
        
        for assignment in sortedAssignments {
            statuses.insert(assignment.status)
        }
        
        let designType = designTypeOf(statuses)
        
        var components = GSCalendarUIComponents()
        
        if selected {
            GSPrint("\n\nStatus\n-----------------------------\n\(statuses)")
            GSPrint("Design Type: \(designType)")
        }
        
        switch designType {
            
        case .noAssignment:
            update_NO_ASSIGNMENT(&components)
            break
            
        case .cancelled:
            update_CANCELLED(&components, assignments: sortedAssignments)
            break
            
        case .shift:
            update(&components, selected: selected, assignments: sortedAssignments)
            break
            
        case .withoutImage:
            update_WITHOUT_IMAGE(&components, selected: selected)
            break
            
        case .withImage:
            update_WITH_IMAGE(&components, selected: selected, assignments: sortedAssignments)
            break
        }
        
        // Set Selected
        setSelected(&components, selected: selected, date: date)
        
        return components
    }
    
    static func setSelected(_ components: inout GSCalendarUIComponents, selected: Bool, date: Date) {
        
        components.today = date.isToday
        components.borderWidth = selected ? 1.0 : 0.0
        
        if date.isToday {
            components.color = .white
        }
    }
}

extension GSCalendarUI {
    
    fileprivate static func designTypeOf(_ statuses: Set<GSAssignmentStatus>) -> GSCalendarDesignType {
        
        if statuses.count > 0 {
            
            let only_my_shift_statuses: Set<GSAssignmentStatus> = GSAssignmentStatusSet.myShift.subtracting([.CANCELED])
            //GSPrint("\n\nOnly My Shifts: \(only_my_shift_statuses)")
            
            let only_open_shift_statuses: Set<GSAssignmentStatus> = GSAssignmentStatusSet.openShift.subtracting(only_my_shift_statuses).subtracting([.CANCELED])
            //GSPrint("\n\nOnly Open Shifts: \(only_open_shift_statuses)")
            
            let only_swap_statuses: Set<GSAssignmentStatus> = GSAssignmentStatusSet.swap.subtracting(only_my_shift_statuses).subtracting([.CANCELED])
            //GSPrint("\n\nOnly Swap: \(only_swap_statuses)")
            
            //NOTE: isDisjoint Returns Empty if There are common elements in 2 sets
            if statuses.contains(.CANCELED) && statuses.count == 1 {
                return .cancelled
            }
            else if !statuses.isDisjoint(with: only_open_shift_statuses) { // Check if only_open_shift_statuses contains statuses
                
                // Check if Statuses also contains my_shift_status OR common elements
                if !statuses.isDisjoint(with: only_my_shift_statuses) {
                    return .withImage
                }
                return .withoutImage
            }
            else if !statuses.isDisjoint(with: only_swap_statuses) { // Check if only_swap_statuses contains statuses
                
                // Check if Statuses also contains my_shift_status OR common elements
                if !statuses.isDisjoint(with: only_my_shift_statuses) {
                    return .withImage
                }
                return .withoutImage
            }
            else if !statuses.isDisjoint(with: only_my_shift_statuses) { // Check if only_my_shift_statuses contains statuses
                return .shift
            }
        }
        return .noAssignment
    }
}

extension GSCalendarUI {
    
    fileprivate static func update_NO_ASSIGNMENT(_ components: inout GSCalendarUIComponents) {
        components.backgroundColor = .white
        components.image = nil
        components.color = .black
    }
    
    fileprivate static func update_CANCELLED(_ components: inout GSCalendarUIComponents,
                                             assignments: [GSAssignment]) {
        if let assignment = assignments.first {
            components.reason = assignment.cancelReason?.shortCode
        }
    }
    
    static func update(_ components: inout GSCalendarUIComponents,
                       selected: Bool,
                       assignments: [GSAssignment]) {
        
        let assignmentTiming = assignments.assignmentTiming
        
        if assignments.isClinical {
            let image = selected ? assignmentTiming.shiftColorImage : assignmentTiming.whiteImage
            components.image = image
            setClinical(&components, selected: selected, assignmentTiming: assignmentTiming)
        }
        else {
            setNonClinical(&components, selected: selected, assignmentTiming: assignmentTiming)
        }
    }
    
    fileprivate static func update_WITH_IMAGE(_ components: inout GSCalendarUIComponents,
                                              selected: Bool,
                                              assignments: [GSAssignment]) {
        
        update_WITHOUT_IMAGE(&components, selected: selected)
        
        let assignmentTiming = assignments.assignmentTiming
        components.image = selected ? assignmentTiming.greenImage : assignmentTiming.whiteImage
    }
    
    fileprivate static func update_WITHOUT_IMAGE(_ components: inout GSCalendarUIComponents,
                                                 selected: Bool) {
        
        components.image = nil
        
        if selected {
            components.backgroundColor = .white
            components.color = .openShift
        }
        else {
            components.backgroundColor = .openShift
            components.color = .white
        }
    }
}

extension GSCalendarUI {
    
    fileprivate static func setClinical(_ components: inout GSCalendarUIComponents,
                                        selected: Bool,
                                        assignmentTiming: GSAssignmentTiming) {
        if selected {
            components.backgroundColor = .white
            components.color = assignmentTiming.color
        }
        else {
            components.backgroundColor = assignmentTiming.color
            components.color = .white
        }
    }
    
    fileprivate static func setNonClinical(_ components: inout GSCalendarUIComponents,
                                           selected: Bool,
                                           assignmentTiming: GSAssignmentTiming) {
        
        components.backgroundColor = selected ? .clinicalSelected : .clinicalUnselected
        components.color = assignmentTiming.color
        components.image = assignmentTiming.shiftColorImage
    }
}

extension Array where Element: GSAssignment {
    
    /// Get Shift
    fileprivate var assignmentTiming: GSAssignmentTiming {
        return GSAssignmentTiming()
    }
    
    /// Check if it is clinical or non clinical
    fileprivate var isClinical: Bool {
        
        var clinical = true
        for assignment in self {
            clinical = assignment.clinical
            break
        }
        return clinical
    }
}

extension UIColor {
    
    static var cancelReason: UIColor { return UIColor(rgbValue: 0xE74C3C) }
    
    static var openShift: UIColor { return UIColor(red: 3.0/255.0, green: 182.0/255.0, blue: 139.0/255.0, alpha: 1.0) }
    
    static var newRequest: UIColor { return UIColor(red: 230.0/255.0, green: 126.0/255.0, blue: 34.0/255.0, alpha: 1.0) }
    
    static var dayShift: UIColor { return UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 216.0/255.0, alpha: 1.0) }
    
    static var inboxLight: UIColor { return UIColor(red: 142.0/255.0, green: 142.0/255.0, blue: 147.0/255.0, alpha: 1.0) }
    
    static var clinicalSelected: UIColor { return .white }
    
    static var clinicalUnselected: UIColor { return UIColor(rgbValue: 0xEFEFEF) }
}
