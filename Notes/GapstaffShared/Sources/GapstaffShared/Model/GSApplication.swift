//
//  GSApplication.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 02/02/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

public class GSApplication: NSObject {
    
    public var id: Int?
    public var assignmentId: Int?
    public var appliedById: Int?
    public var appliedByName = ""
    public var appliedByProfilePicture = ""
    public var appliedDate = ""
    public var lastUpdateDate = ""
    public var status: GSApplicationStatus = .NONE
    public var rowStatus = ""
    public var swapAssignment: GSAssignment?
    
    public init(_ dictionary: [String: Any]) {
        
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
            self.status = GSApplicationStatus(rawValue: status) ?? .NONE
        }
        
        if let rowStatus = dictionary["rowStatus"] as? String {
            self.rowStatus = rowStatus
        }
        
        if let swapAssignment = dictionary["swapAssignment"] as? [String: Any] {
            self.swapAssignment = GSAssignment(swapAssignment)
        }
    }
}
