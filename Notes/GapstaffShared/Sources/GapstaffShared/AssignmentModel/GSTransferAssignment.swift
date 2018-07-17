//
//  GSTransferAssignment.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 09/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

public class GSTransferAssignment: NSObject {
    
    public var id: Int?
    
    public var type = ""
    
    public var assignmentId: Int?
    
    public var appliedById: Int?
    
    public var status: GSAssignmentStatus = .NONE
    
    public var createdDate = ""
    
    public var lastUpdateDate = ""
    
    public var rowStatus = ""
    
    public var assignment: GSAssignment?
    
    //    public var transferChoices = GSTransferChoices()
    
    public var invtations = [GSInvitation]()
    
    public var applications = [GSApplication]()
    
    public override init() {
        super.init()
    }
    
    public init(_ dictionary: [String: Any]) {
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let type = dictionary["type"] as? String {
            self.type = type
        }
        
        if let assignmentId = dictionary["assignmentId"] as? Int {
            self.assignmentId = assignmentId
        }
        
        if let appliedById = dictionary["appliedById"] as? Int {
            self.appliedById = appliedById
        }
        
        if let cDate = dictionary["createdDate"] as? String {
            self.createdDate = cDate
        }
        
        if let lUDate = dictionary["lastUpdateDate"] as? String {
            self.lastUpdateDate = lUDate
        }
        
        if let rStatus = dictionary["rowStatus"] as? String {
            self.rowStatus = rStatus
        }
        
        // Transfer Choices
        //        if let transferChoices = dictionary["transferChoices"] as? [String: Any] {
        //            self.transferChoices.initialise(transferChoices)
        //        }
        
        if let invitations = dictionary["invitations"] as? [[String: Any]] {
            for invitation in invitations {
                self.invtations.append(GSInvitation(invitation))
            }
        }
        
        if let applications = dictionary["applications"] as? [[String: Any]] {
            for application in applications {
                self.applications.append(GSApplication(application))
            }
        }
        
        if let assignment = dictionary["assignment"] as? [String: Any] {
            self.assignment = GSAssignment(assignment)
        }
    }
}

extension GSTransferAssignment {
    
    public var confirmed_application: GSApplication? {
        
        let cApplication = applications.first { (application) -> Bool in
            return application.status == .CONFIRMED
        }
        return cApplication
    }
    
    
    public var appliedApplicationsCount: Int {
        let applied_applications = self.applications.filter { (application) -> Bool in
            return application.status == .APPLIED
        }
        return applied_applications.count
    }
}
