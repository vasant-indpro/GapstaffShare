//
//  GSInvitation.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 22/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

class GSInvitation: NSObject {
    
    var iId: Int?
    var type = ""
    var status = ""
    var invitationById: Int?
    var invitationByName = ""
    var invitationToId: Int?
    var invitationToName = ""
    var invitationToProfilePicture = ""
    var assignmentId: Int?
    var message = ""
    var createdDate = ""
    var lastUpdateDate = ""
    var rowStatus = ""
    
    init(_ dictionary: [String: Any]) {
        
        if let iId = dictionary["id"] as? Int {
            self.iId = iId
        }
        
        if let type = dictionary["type"] as? String {
            self.type = type
        }
        
        if let status = dictionary["status"] as? String {
            self.status = status
        }
        
        if let invitationById = dictionary["invitationById"] as? Int {
            self.invitationById = invitationById
        }
        
        if let invitationByName = dictionary["invitationByName"] as? String {
            self.invitationByName = invitationByName
        }
        
        if let invitationToId = dictionary["invitationToId"] as? Int {
            self.invitationToId = invitationToId
        }
        
        if let invitationToName = dictionary["invitationToName"] as? String {
            self.invitationToName = invitationToName
        }
        
        if let invitationToProfilePicture = dictionary["invitationToProfilePicture"] as? String {
            self.invitationToProfilePicture = invitationToProfilePicture
        }
        
        if let assignmentId = dictionary["assignmentId"] as? Int {
            self.assignmentId = assignmentId
        }
        
        if let message = dictionary["message"] as? String {
            self.message = message
        }
        
        if let createdDate = dictionary["createdDate"] as? String {
            self.createdDate = createdDate
        }
        
        if let lastUpdateDate = dictionary["lastUpdateDate"] as? String {
            self.lastUpdateDate = lastUpdateDate
        }
        
        if let rowStatus = dictionary["rowStatus"] as? String {
            self.rowStatus = rowStatus
        }
    }
}

extension Array where Element: GSInvitation {
    
    /// Sort Invitations
    ///
    /// - Returns: Sorted Invitations
    var sortIdWise: [GSInvitation] {
        GSPrint("\n\nOriginal Array: \(self)")
        let sorted_invitations = self.sorted { (invitation1, invitation2) -> Bool in
            
            let id1 = invitation1.iId
            let id2 = invitation2.iId
            
            return id1! > id2!
        }
        return sorted_invitations
    }
}
