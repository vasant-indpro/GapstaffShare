//
//  GSCalendarUI.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 03/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

fileprivate enum GSCalendarDesignType {
    case noAssignment
    case cancelled
    case shift
    case withImage
    case withoutImage
}

class GSCalendarUI: NSObject {
    
    var components = GSCalendarUIComponents()
    
    init(_ dayAssignment: GSDayAssignment, selected: Bool) {
        super.init()
        
        let sortedAssignments = dayAssignment.assignments.filter()
        
        let statuses = dayAssignment.uniqueStatuses
        
        let designType = designTypeOf(statuses)
        if selected {
            GSPrint("\n\nStatus\n-----------------------------\n\(statuses)")
            GSPrint("Design Type: \(designType)\n\n")
        }
        
        components.borderWidth = selected ? 1.0 : 0.0
        
        switch designType {
            
        case .noAssignment:
            update_NO_ASSIGNMENT()
            break
            
        case .cancelled:
            update_CANCELLED(assignments: sortedAssignments)
            break
            
        case .shift:
            update(selected: selected,
                   assignments: sortedAssignments,
                   assignmentTiming: dayAssignment.assignmentTiming(for: sortedAssignments))
            break
            
        case .withoutImage:
            update_WITHOUT_IMAGE(selected: selected)
            break
            
        case .withImage:
            update_WITH_IMAGE(selected: selected,
                              assignments: sortedAssignments,
                              assignmentTiming: dayAssignment.assignmentTiming(for: sortedAssignments))
            break
        }
    }
}

extension GSCalendarUI {
    
    fileprivate func designTypeOf(_ statuses: Set<GSAssignmentStatus>) -> GSCalendarDesignType {
        
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
    
    fileprivate func update_NO_ASSIGNMENT() {
        components.backgroundColor = .white
        components.image = nil
        components.color = .black
    }
    
    fileprivate func update_CANCELLED(assignments: [GSAssignment]) {
        if let assignment = assignments.first {
            components.reason = assignment.cancelReason?.shortCode
        }
    }
    
    func update(selected: Bool,
                assignments: [GSAssignment],
                assignmentTiming: GSAssignmentTiming) {
        
        if assignments.isClinical {
            let image = selected ? assignmentTiming.shiftColorImage : assignmentTiming.whiteImage
            components.image = image
            setClinical(selected: selected, assignmentTiming: assignmentTiming)
        }
        else {
            setNonClinical(selected: selected, assignmentTiming: assignmentTiming)
        }
    }
    
    fileprivate func update_WITH_IMAGE(selected: Bool,
                                       assignments: [GSAssignment],
                                       assignmentTiming: GSAssignmentTiming) {
        
        update_WITHOUT_IMAGE(selected: selected)
        components.image = selected ? assignmentTiming.greenImage : assignmentTiming.whiteImage
    }
    
    fileprivate func update_WITHOUT_IMAGE(selected: Bool) {
        
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
    
    fileprivate func setClinical(selected: Bool,
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
    
    fileprivate func setNonClinical(selected: Bool,
                                    assignmentTiming: GSAssignmentTiming) {
        
        components.backgroundColor = selected ? .clinicalSelected : .clinicalUnselected
        components.color = assignmentTiming.color
        components.image = assignmentTiming.shiftColorImage
    }
}

extension Array where Element: GSAssignment {
    
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

fileprivate extension UIColor {
    
    static var cancelReason: UIColor { return UIColor(rgbValue: 0xE74C3C) }
    
    static var openShift: UIColor { return UIColor(red: 3.0/255.0, green: 182.0/255.0, blue: 139.0/255.0, alpha: 1.0) }
    
    static var newRequest: UIColor { return UIColor(red: 230.0/255.0, green: 126.0/255.0, blue: 34.0/255.0, alpha: 1.0) }
    
    static var dayShift: UIColor { return UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 216.0/255.0, alpha: 1.0) }
    
    static var inboxLight: UIColor { return UIColor(red: 142.0/255.0, green: 142.0/255.0, blue: 147.0/255.0, alpha: 1.0) }
    
    static var clinicalSelected: UIColor { return .white }
    
    static var clinicalUnselected: UIColor { return UIColor(rgbValue: 0xEFEFEF) }
}
