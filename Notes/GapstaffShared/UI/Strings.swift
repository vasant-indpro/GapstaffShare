//
//  Strings.swift
//  GapstaffHealthCare
//
//  Created by Vasant Hugar on 12/07/18.
//  Copyright © 2018 Gapstaff. All rights reserved.
//

import Foundation

class Strings {
    
    struct assignment {
        
        static let nodata_message = NSLocalizedString("See who's working",
                                                      comment: "See who's working")
        
        static let nodata_my_shifts = NSLocalizedString("No booked passports",
                                                        comment: "No booked passports")
        
        static let nodata_swaps = NSLocalizedString("No changes",
                                                    comment: "No changes")
        
        static let nodata_open_shifts = NSLocalizedString("No available passports",
                                                          comment: "No available passports")
        
        static let request = NSLocalizedString("Request",
                                               comment: "Request")
        
        static let pending_approval = NSLocalizedString("Pending approval",
                                                        comment: "Pending approval")
        
        static let available_swap = NSLocalizedString("Available swap",
                                                      comment: "Available swap")
        
        static let new_swap_proposal = NSLocalizedString("New swap proposal",
                                                         comment: "New swap proposal")
        
        static let pending_swap_approval = NSLocalizedString("Pending swap approval",
                                                             comment: "Pending swap approval")
        
        static let pending_application = NSLocalizedString("Pending application",
                                                           comment: "Pending application")
        
        static let request_denied = NSLocalizedString("You declined this request",
                                                      comment: "You declined this request")
        
        static let request_cancelled = NSLocalizedString("Request Cancelled",
                                                         comment: "Request Cancelled")
        
    }
    
    struct calendar {
        
        static let MON = NSLocalizedString("MON", comment: "MON")
        static let TUE = NSLocalizedString("TUE", comment: "TUE")
        static let WED = NSLocalizedString("WED", comment: "WED")
        static let THU = NSLocalizedString("THU", comment: "THU")
        static let FRI = NSLocalizedString("FRI", comment: "FRI")
        static let SAT = NSLocalizedString("SAT", comment: "SAT")
        static let SUN = NSLocalizedString("SUN", comment: "SUN")
    }
}
