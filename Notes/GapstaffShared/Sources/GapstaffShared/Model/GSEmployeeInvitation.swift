//
//  GSEmployeeInvitation.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 22/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

class GSEmployeeInvitation: NSObject {
    
    var employeeId: Int?
    var employeeName = ""
    var employeeProfilePicture = ""
    var available = ""
    var veto = ""
    var applications = [Any]()
    var invtations = [GSInvitation]()
    
    init(_ dictionary: [String: Any]) {
        
        if let employeeId = dictionary["employeeId"] as? Int {
            self.employeeId = employeeId
        }
        
        if let employeeName = dictionary["employeeName"] as? String {
            self.employeeName = employeeName
        }
        
        if let employeeProfilePicture = dictionary["employeeProfilePicture"] as? String {
            self.employeeProfilePicture = employeeProfilePicture
        }
        
        if let available = dictionary["available"] as? String {
            self.available = available
        }
        
        if let veto = dictionary["veto"] as? String {
            self.veto = veto
        }
        
        if let invitations = dictionary["invitations"] as? [[String: Any]] {
            for invitation in invitations {
                self.invtations.append(GSInvitation(invitation))
            }
        }
    }
}
