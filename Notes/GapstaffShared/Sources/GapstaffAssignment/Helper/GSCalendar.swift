//
//  GSCalendar.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 13/11/17.
//  Copyright © 2017 Vasant Indpro. All rights reserved.
//

import UIKit

fileprivate var currentLanguageIdendifier: String {
    return "EN"
}

class GSCalendar: NSObject {
    
    // TimeZone
    private static var timeZone: TimeZone = TimeZone(abbreviation: "CET")!
    
    /// Set Forced time zone to Date/Calendar or App Level timezone
    static func setDefaultTimeZone() {
        TimeZone.ReferenceType.default = timeZone
    }
    
    /// Calendar with forced TimeZone
    static var calendar: Calendar {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        calendar.locale = Locale(identifier: currentLanguageIdendifier)
        return calendar
    }
    
    /// DateFormatter with forced TimeZone
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale(identifier: currentLanguageIdendifier)
        return formatter
    }
}
