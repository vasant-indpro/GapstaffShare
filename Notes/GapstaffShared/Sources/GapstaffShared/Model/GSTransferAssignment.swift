//
//  GSTransferAssignment.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 09/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

class GSTransferAssignment: NSObject {
    
    var id: Int?
    
    var type = ""
    
    var assignmentId: Int?
    
    var appliedById: Int?
    
    var status: AssignmentStatus = .NONE
    
    var createdDate = ""
    
    var lastUpdateDate = ""
    
    var rowStatus = ""
    
    var assignment: Assignment?
    
    //    var transferChoices = GSTransferChoices()
    
    var invtations = [GSInvitation]()
    
    var applications = [GSApplication]()
    
    var confirmed_application: GSApplication? {
        
        let cApplication = applications.first { (application) -> Bool in
            return application.status == .CONFIRMED
        }
        return cApplication
    }
    
    
    var appliedApplicationsCount: Int {
        let applied_applications = self.applications.filter { (application) -> Bool in
            return application.status == .APPLIED
        }
        return applied_applications.count
    }
    
    func initialise(_ dictionary: [String: Any]) {
        
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
            self.assignment = Assignment(assignment)
        }
    }
}
