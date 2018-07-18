//
//  AssignmentFilter.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 22/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

class AssignmentFilter: NSObject {
    
    /// Filter assignments based on Type
    ///
    /// Parameters: assignments: Array of Assignment
    /// Returns: Filtered Array of Assignment
    static func filter(_ assignments: [GSAssignment]) -> [GSAssignment] {
        return split(assignments)
    }
    
    /// Split assignments into my Shifts, Swap, Open Shift and Swap Calendar
    ///
    /// - Parameter assignments: Array of Assignments
    /// - Returns: (myShifts, swap, openShifts)
    private static func split(_ assignments: [GSAssignment]) -> [GSAssignment] {
        
        guard assignments.count != 0 else {
            return []
        }
        
        var openShiftArray = [GSAssignment]()
        
        var lowPriorityOpenShiftArray = [GSAssignment]()
        
        var topPriorityOpenShiftArray = [GSAssignment]()
        
        /// Sort the Assignments Date wise
        let sortedAssignment = assignments.sortDateWise
        
        for assignment in sortedAssignment {
            
            if GSAssignmentStatusSet.openShift.contains(assignment.status) {
                
                if assignment.status == .CANCELED {
                    lowPriorityOpenShiftArray.append(assignment)
                }
                else if GSAssignmentStatusSet.topPriority.contains(assignment.status) {
                    topPriorityOpenShiftArray.append(assignment)
                }
                else {
                    openShiftArray.append(assignment)
                }
            }
        }
        
        let final_openShift = topPriorityOpenShiftArray + openShiftArray + lowPriorityOpenShiftArray
        
        return final_openShift
    }
}

extension Array where Element: GSAssignment {
    
    /// Sort Assignments
    ///
    /// - Returns: Sorted Assignments
    fileprivate var sortDateWise: [GSAssignment] {
        
        GSPrint("\n\nOriginal Array: \(self)")
        let sorted_assignments = self.sorted { (assignment1, assignment2) -> Bool in
            
            let date1 = assignment1.start.convertToDate
            let date2 = assignment2.start.convertToDate
            
            return date1.compare(date2) == .orderedAscending
        }
        GSPrint("\nSorted Array: \(sorted_assignments)\n\n")
        return sorted_assignments
    }
}

