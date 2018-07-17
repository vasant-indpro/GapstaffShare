//
//  DayAssignment.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 09/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

struct DayAssignment {
    
    var day = ""
    
    var assignments = [Assignment]()
    
    var unique_status = Set<AssignmentStatus>()
    
    var assignmentTimings = [AssignmentTiming]()
    
    var cancelReason: GSCancelReason?
    
    init(_ dictionary: [String: Any]) {
        
        if let day = dictionary["day"] as? String {
            self.day = day
        }
        
        if let assignments = dictionary["assignments"] as? [[String : Any]] {
            
            for assignment in assignments {
                let assignment = Assignment(assignment)
                self.assignments.append(assignment)
                self.unique_status.insert(assignment.status)
            }
        }
        
        if let assignmentTimings = dictionary["assignmentTimings"] as? [[String : Any]] {
            
            for assignmentTiming in assignmentTimings {
                self.assignmentTimings.append(AssignmentTiming(assignmentTiming))
            }
        }
        
        if let dayAvailabilities = dictionary["dayAvailabilities"] as? [[String: Any]] {
            
            for dayAvailability in dayAvailabilities {
                
                if let availabilities = dayAvailability["availabilities"] as? [[String: Any]] {
                    
                    for availability in availabilities {
                        
                        if let status = availability["shift"] as? String, status == "CANCEL" {
                            if let cancelReason = availability["cancelReason"] as? [String: Any] {
                                self.cancelReason = GSCancelReason(cancelReason)
                            }
                        }
                    }
                }
            }
        }
    }
}

extension DayAssignment {
    
    /// Get assignment timings based on Start time of Assignment
    ///
    /// - Parameter start: Start time of Assignment
    /// - Returns: AssignmentTiming
    func getAssignmentTiming(_ start: String) -> AssignmentTiming {
        
        let date = start.convertToDate
        let dateComponents = getHrMin(from: date)
        
        let totalMinutes = dateComponents.hour * 60 + dateComponents.min
        GSPrint("\n\nTotal minuts from Shift: \(totalMinutes)\n\n")
        
        for assignmentTiming in assignmentTimings {
            
            let start = getMinutes(from: assignmentTiming.start)
            let end = getMinutes(from: assignmentTiming.end)
            
            if totalMinutes >= start && totalMinutes <= end {
                return assignmentTiming
            }
        }
        return AssignmentTiming()
    }
    
    /// Get the Hours and Minutes from the Date
    ///
    /// - Parameter date: Date object
    /// - Returns: hours and mins
    private func getHrMin(from date: Date) -> (hour: Int, min: Int) {
        
        let calendar = GSCalendar.calendar
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        return (hour, minutes)
    }
    
    /// Get minutes from Slots
    ///
    /// - Parameter from: Slot date
    /// - Returns: Total number of minutes
    private func getMinutes(from: String) -> Int {
        
        let components = from.components(separatedBy: ":")
        
        let hour: Int = Int(components.first!)!
        let min: Int  = Int(components.last!)!
        
        return hour * 60 + min
    }
}
