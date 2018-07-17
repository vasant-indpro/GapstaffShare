//
//  GSself.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 19/02/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

class GSUser: NSObject {
    
    var id: Int?
    var username = ""
    var lastPasswordReset = ""
    var profilePicture = ""
    var dob = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var tel1 = ""
    var externalUserId = ""
    var rowStatus = ""
    var enabled: Bool = false
    
    init(_ dictionary: [String: Any]) {
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let username = dictionary["username"] as? String {
            self.username = username
        }
        
        if let lstPaswordReset = dictionary["lastPasswordReset"] as? String {
            self.lastPasswordReset = lstPaswordReset
        }
        
        if let firstName = dictionary["firstName"] as? String {
            self.firstName = firstName
        }
        
        if let lastName = dictionary["lastName"] as? String {
            self.lastName = lastName
        }
        
        if let profilePicture = dictionary["profilePicture"] as? String {
            self.profilePicture = profilePicture
        }
        
        if let dateOfBirth = dictionary["dateOfBirth"] as? String {
            self.dob = dateOfBirth
        }
        
        if let email = dictionary["email"] as? String {
            self.email = email
        }
        
        if let tel1 = dictionary["tel1"] as? String {
            self.tel1 = tel1
        }
        
        if let externalUserId = dictionary["externalUserId"] as? String {
            self.externalUserId = externalUserId
        }
        
        if let rowStatus = dictionary["rowStatus"] as? String {
            self.rowStatus = rowStatus
        }
        
        if let enabled = dictionary["enabled"] as? Bool {
            self.enabled = enabled
        }
    }
}


