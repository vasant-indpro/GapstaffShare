//
//  GSApplication.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 02/02/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

class GSApplication: NSObject {
    
    var id: Int?
    var assignmentId: Int?
    var appliedById: Int?
    var appliedByName = ""
    var appliedByProfilePicture = ""
    var appliedDate = ""
    var lastUpdateDate = ""
    var status: ApplicationStatus = .NONE
    var rowStatus = ""
    var swapAssignment: Assignment?
    
    init(_ dictionary: [String: Any]) {
     
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let assignmentId = dictionary["assignmentId"] as? Int {
            self.assignmentId = assignmentId
        }
        
        if let appliedById = dictionary["appliedById"] as? Int {
            self.appliedById = appliedById
        }
        
        if let appliedByName = dictionary["appliedByName"] as? String {
            self.appliedByName = appliedByName
        }
        
        if let appliedDate = dictionary["appliedDate"] as? String {
            self.appliedDate = appliedDate
        }
        
        if let lastUpdateDate = dictionary["lastUpdateDate"] as? String {
            self.lastUpdateDate = lastUpdateDate
        }
        
        if let status = dictionary["status"] as? String {
            self.status = ApplicationStatus(rawValue: status) ?? .NONE
        }
        
        if let rowStatus = dictionary["rowStatus"] as? String {
            self.rowStatus = rowStatus
        }
        
        if let swapAssignment = dictionary["swapAssignment"] as? [String: Any] {
            self.swapAssignment = Assignment(swapAssignment)
        }
    }
}
