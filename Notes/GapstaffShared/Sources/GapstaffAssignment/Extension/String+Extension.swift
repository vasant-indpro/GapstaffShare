//
//  String+Extension.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 09/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import Foundation

extension String {
    
    /// Convert String to Date
    var date: Date {
        let dateFormatter = GSCalendar.dateFormatter
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm Z"
        return dateFormatter.date(from: self)!
    }
    
    var gs_date: Date {
        let formatter = GSCalendar.dateFormatter
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)!
    }
    
    var convertToDate: Date {
        let formatter = GSCalendar.dateFormatter
        formatter.dateFormat = "yyyy-MM-dd HH:mm ZZZZ"
        let myDate = formatter.date(from: self)
        return myDate!
    }
    
    var trimWhitespacesAndNewlines: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Calculate Length Of String
    var length: Int {
        return self.characters.count
    }
    
    /// Validate Email address
    var isValidEmail: Bool {
        
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        }
        catch {
            return false
        }
    }
}
