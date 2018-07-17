//
//  GSStaffing.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 09/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

public class GSStaffing: NSObject {
    
    public var firstName = ""
    
    public var lastName = ""
    
    public var profilePicture = ""
    
    public var start = ""
    
    public var end = ""
    
    public var activity1Title = ""
    
    public var activity2End = ""
    
    public var activity2Start = ""
    
    public var activity2Title = ""
    
    public var positionName = ""
    
    public var id: Int?
    
    public var status: GSStaffingStatus = .NONE
    
    public var invtation: GSInvitation?
    
    public var transferApplication: GSApplication?
    
    public init(_ dictionary: [String: Any]) {
        
        if let firstName = dictionary["firstName"] as? String {
            self.firstName = firstName
        }
        
        if let lastName = dictionary["lastName"] as? String {
            self.lastName = lastName
        }
        
        if let profilePicture = dictionary["profilePicture"] as? String {
            self.profilePicture = profilePicture
        }
        
        if let start = dictionary["start"] as? String {
            self.start = start
        }
        
        if let end = dictionary["end"] as? String {
            self.end = end
        }
        
        // Newly added
        if let activity1Title = dictionary["activity1Title"] as? String {
            self.activity1Title = activity1Title
        }
        
        if let activity2Title = dictionary["activity2Title"] as? String {
            self.activity2Title = activity2Title
        }
        
        if let activity2Start = dictionary["activity2Start"] as? String {
            self.activity2Start = activity2Start
        }
        
        if let activity2End = dictionary["activity2End"] as? String {
            self.activity2End = activity2End
        }
        
        if let status = dictionary["status"] as? String {
            self.status = GSStaffingStatus(rawValue: status)!
        }
        
        if let positionName = dictionary["positionName"] as? String {
            self.positionName = positionName
        }
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let invitation = dictionary["transferInvitation"] as? [String: Any] {
            self.invtation = GSInvitation(invitation)
        }
        
        if let transferApplication = dictionary["transferApplication"] as? [String: Any] {
            self.transferApplication = GSApplication(transferApplication)
        }
    }
}

extension GSStaffing {
    
    public var isProposalAvailable: Bool {
        return (transferApplication != nil)
    }
}
