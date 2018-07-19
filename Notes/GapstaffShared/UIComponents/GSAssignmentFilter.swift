//
//  GSAssignmentFilter.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 22/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

extension Array where Element: GSAssignment {
    
    func filter() -> [GSAssignment] {
        return split()
    }
    
    private func split() -> [GSAssignment] {
        
        guard self.count != 0 else {
            return []
        }
        
        var openShiftArray = [GSAssignment]()
        
        var lowPriorityOpenShiftArray = [GSAssignment]()
        
        var topPriorityOpenShiftArray = [GSAssignment]()
        
        /// Sort the Assignments Date wise
        let sortedAssignment = sortDateWise
        
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

