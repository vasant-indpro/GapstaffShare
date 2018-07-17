//
//  GSself.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 02/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

class Assignment: NSObject {
    
    var id: Int?
    
    var createdById: Int?
    
    var createdByName = ""
    
    var createdByProfilePicture = ""
    
    var assignedToId: Int?
    
    var assignedToName = ""
    
    var assignedToProfilePicture = ""
    
    var groupId: Int?
    
    var groupName = ""
    
    var position: Int?
    
    var positionName = ""
    
    var competence1Id: Int?
    
    var competence1Name = ""
    
    var competence2Id: Int?
    
    var competence2Name = ""
    
    var competence3Id: Int?
    
    var competence3Name = ""
    
    var desc = ""
    
    var start = ""
    
    var end = ""
    
    var created = ""
    
    var lastUpdate = ""
    
    var rowStatus = ""
    
    var status: AssignmentStatus = .APPLIED
    
    var activity1Id: Int?
    
    var activity1Title = ""
    
    var activity1Clinical: Bool = false
    
    var activity2Id: Int?
    
    var activity2Title = ""
    
    var activity2Clinical: Bool = false
    
    var activity2Start = ""
    
    var activity2End = ""
    
    var importFileId: Int?
    
    var task = ""
    
    var activeAssignmentId: Int?
    
    var externalId: Int?
    
    var activeAssignmentStatus = ""
    
    var activeAssignmentDate = ""
    
    var clinical: Bool = true
    
    var staffing = [GSStaffing]()
    
    var applications = [GSApplication]()
    
    var employeeInvitations = [GSEmployeeInvitation]()
    
    var transferAssignment = GSTransferAssignment()
    
    var cancelReason: GSCancelReason?
    
    override init() {
        super.init()
    }
    
    init(_ dictionary: [String: Any]) {
        
        super.init()
        
        if let clinical = dictionary["clinical"] as? Bool {
            self.clinical = clinical
        }
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let createdById = dictionary["createdById"] as? Int {
            self.createdById = createdById
        }
        
        if let createdByName = dictionary["createdByName"] as? String {
            self.createdByName = createdByName
        }
        
        if let createdProfilePic = dictionary["createdByProfilePicture"] as? String {
            self.createdByProfilePicture = createdProfilePic
        }
        
        if let assignedToId = dictionary["assignedToId"] as? Int {
            self.assignedToId = assignedToId
        }
        
        if let assignedToName = dictionary["assignedToName"] as? String {
            self.assignedToName = assignedToName
        }
        
        if let profilePic = dictionary["assignedToProfilePicture"] as? String {
            self.assignedToProfilePicture = profilePic
        }
        
        if let gId = dictionary["groupId"] as? Int {
            self.groupId = gId
        }
        
        if let groupName = dictionary["groupName"] as? String {
            self.groupName = groupName
        }
        
        if let pId = dictionary["position"] as? Int {
            self.position = pId
        }
        
        if let pName = dictionary["positionName"] as? String {
            self.positionName = pName
        }
        
        if let competence1Id = dictionary["competence1Id"] as? Int {
            self.competence1Id = competence1Id
        }
        
        if let competence1Name = dictionary["competence1Name"] as? String {
            self.competence1Name = competence1Name
        }
        
        if let competence2Id = dictionary["competence2Id"] as? Int {
            self.competence2Id = competence2Id
        }
        
        if let competence2Name = dictionary["competence2Name"] as? String {
            self.competence2Name = competence2Name
        }
        
        if let competence3Id = dictionary["competence3Id"] as? Int {
            self.competence3Id = competence3Id
        }
        
        if let competence3Name = dictionary["competence3Name"] as? String {
            self.competence3Name = competence3Name
        }
        
        if let desc = dictionary["description"] as? String {
            self.desc = desc
        }
        
        if let start = dictionary["start"] as? String {
            self.start = start
        }
        
        if let end = dictionary["end"] as? String {
            self.end = end
        }
        
        if let created = dictionary["created"] as? String {
            self.created = created
        }
        
        if let lastUpdate = dictionary["lastUpdate"] as? String {
            self.lastUpdate = lastUpdate
        }
        
        if let sts = dictionary["status"] as? String {
            self.status = AssignmentStatus(rawValue: sts)!
        }
        
        if let activity1Id = dictionary["activity1Id"] as? Int {
            self.activity1Id = activity1Id
        }
        
        if let activity1Title = dictionary["activity1Title"] as? String {
            self.activity1Title = activity1Title
        }
        
        if let activity1Clinical = dictionary["activity1Clinical"] as? Bool {
            self.activity1Clinical = activity1Clinical
        }
        
        if let activity2Id = dictionary["activity2Id"] as? Int {
            self.activity2Id = activity2Id
        }
        
        if let activity2Title = dictionary["activity2Title"] as? String {
            self.activity2Title = activity2Title
        }
        
        if let activity2Clinical = dictionary["activity2Clinical"] as? Bool {
            self.activity2Clinical = activity2Clinical
        }
        
        if let activity2Start = dictionary["activity2Start"] as? String {
            self.activity2Start = activity2Start
        }
        
        if let activity2End = dictionary["activity2End"] as? String {
            self.activity2End = activity2End
        }
        
        if let importFileId = dictionary["importFileId"] as? Int {
            self.importFileId = importFileId
        }
        
        if let rowStatus = dictionary["rowStatus"] as? String {
            self.rowStatus = rowStatus
        }
        
        if let aTask = dictionary["task"] as? String {
            self.task = aTask
        }
        
        if let externalId = dictionary["externalId"] as? Int {
            self.externalId = externalId
        }
        
        if let activeAssignmentId = dictionary["activeAssignmentId"] as? Int {
            self.activeAssignmentId = activeAssignmentId
        }
        
        if let actAssStatus = dictionary["activeAssignmentStatus"] as? String {
            self.activeAssignmentStatus = actAssStatus
        }
        
        if let actADate = dictionary["activeAssignmentDate"] as? String {
            self.activeAssignmentDate = actADate
        }
        
        // Staffing
        if let staffings = dictionary["staffing"] as? [[String: Any]] {
            for staff in staffings {
                let staf = GSStaffing(staff)
                self.staffing.append(staf)
            }
        }
        
        // Transfer Assignment
        if let transferAssignment = dictionary["transferAssignment"] as? [String: Any] {
            self.transferAssignment.initialise(transferAssignment)
        }
        
        // Employee Invitation Assignment
        if let employeeInvitations = dictionary["employeeInvitations"] as? [[String: Any]] {
            
            for employeeInvitation in employeeInvitations {
                let eInvitation = GSEmployeeInvitation(employeeInvitation)
                self.employeeInvitations.append(eInvitation)
            }
        }
        
        // Applications
        if let applications = dictionary["applications"] as? [[String: Any]] {
            for application in applications {
                self.applications.append(GSApplication(application))
            }
        }
        
        // Cancel Reason
        if let cancelReason = dictionary["cancelReason"] as? [String: Any] {
            self.cancelReason = GSCancelReason(cancelReason)
        }
    }
}
