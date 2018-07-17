//
//  GSGroup.swift
//  GapstaffShared
//
//  Created by Vasant Hugar on 17/07/18.
//

import UIKit

public struct GSGroup {
    
    public var id: Int?
    
    public var title = ""
    
    public var description = ""
    
    public var dayAssignments = [GSDayAssignment]()
    
    public var positions = [Any]()
    
    public var contracts = [Any]()
    
    public var salaryModels = [Any]()
    
    public var activities = [Any]()
    
    public var cancelReasons = [GSCancelReason]()
    
    public var competences = [Any]()
    
    public var additionalInfo: Any?
    
    public init() {}
    
    public init(_ dictionary: [String: Any]) {
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        }
        
        if let title = dictionary["title"] as? String {
            self.title = title
        }
        
        if let description = dictionary["description"] as? String {
            self.description = description
        }
        
        if let dayAssignments = dictionary["dayAssignments"] as? [[String : Any]] {
            for dayAssignment in dayAssignments {
                self.dayAssignments.append(GSDayAssignment(dayAssignment))
            }
        }
    }
}
