//
//  GSCancelReason.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 26/02/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

public class GSCancelReason: NSObject {
    
    public var shortCode = ""
    public var title = ""
    public var desc = ""
    public var available = false
    
    public init(_ dictionary: [String: Any]) {
        
        if let shortCode = dictionary["shortCode"] as? String {
            self.shortCode = shortCode
        }
        
        if let title = dictionary["title"] as? String {
            self.title = title
        }
        
        if let description = dictionary["description"] as? String {
            self.desc = description
        }
        
        if let available = dictionary["available"] as? Bool {
            self.available = available
        }
    }
}
