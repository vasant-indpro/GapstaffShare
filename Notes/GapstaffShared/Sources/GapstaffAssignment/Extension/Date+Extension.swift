//
//  Date+Extension.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 09/01/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import Foundation

extension Date {
    
    var isToday: Bool {
        return isEqual(Date())
    }
    
    var isYesterday: Bool {
        return GSCalendar.calendar.isDateInYesterday(self)
    }
    
    func isEqual(_ date: Date) -> Bool {
        
        let order = Calendar.current.compare(self, to: date, toGranularity: .day)
        
        switch order {
        case .orderedAscending, .orderedDescending:
            return false
            
        default:
            return true
        }
    }
    
    var startOfDay: Date {
        
        let calendar = Calendar.current
        var components = calendar.dateComponents([.hour, .minute, .second], from: self)
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        return calendar.date(from: components)!
    }
    
    var monthTitle: String {
        
        let components = Calendar.current.dateComponents([.month, .year], from: self)
        
        let monthName = GSCalendar.dateFormatter.monthSymbols[(components.month! - 1) % 12]
        let year = components.year
        
        return monthName.capitalized + " " + (year?.description)!
    }
    
    var day: String {
        let dateFormatter = GSCalendar.dateFormatter
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self).capitalized
    }
    
    var month: String {
        let dateFormatter = GSCalendar.dateFormatter
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self).capitalized
    }
    
    var shortMonth: String {
        let dateFormatter = GSCalendar.dateFormatter
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self).capitalized
    }
    
    var week: String {
        let dateFormatter = GSCalendar.dateFormatter
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    /// Convert date to String
    var string: String {
        
        let dateFormatter = GSCalendar.dateFormatter
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm Z"
        return dateFormatter.string(from: self)
    }
    
    var gs_string: String {
        let formatter = GSCalendar.dateFormatter
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    var convertToString: String {
        let formatter = GSCalendar.dateFormatter
        formatter.dateFormat = "yyyy-MM-dd HH:mm ZZZZ"
        return formatter.string(from: self)
    }

    //Get hr:min format
    var hr_min: String {
        
        let calendar = GSCalendar.calendar
        let components = calendar.dateComponents([.hour, .minute], from: self)
        
        return (String(format: "%02d", components.hour!) + ":" + String(format: "%02d", components.minute!))
    }
    
    //Get hr:min format check if End date belongs to next day
    func hr_min_End(_ eDate: Date) -> String {
        
        let calendar = GSCalendar.calendar
        let components = calendar.dateComponents([.hour, .minute, .day], from: eDate)
        
        let startDay = calendar.component(.day, from: self)
        let endDay = components.day
        
        
        if startDay + 1 == endDay {
            return (String(format: "%02d", components.hour!) + ":" + String(format: "%02d", components.minute!) + " +1")
        }
        else {
            return (String(format: "%02d", components.hour!) + ":" + String(format: "%02d", components.minute!))
        }
    }
    
    /// Check If Date falls between two dates
    ///
    /// - Parameters:
    ///   - date1: Date()
    ///   - date2: Date()
    /// - Returns: yes if falls else no
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(self)
    }
    
    /// Returns the number of Days from self date to next Date
    ///
    /// - Parameter tillDate: nextDate
    /// - Returns: number of Days
    func numberOfDays(_ nextDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: nextDate).day ?? 0
    }
    
    /// Returns the number of Months from self date to next Date
    ///
    /// - Parameter tillDate: nextDate
    /// - Returns: number of Months
    func numberOfMonths(_ nextDate: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: self, to: nextDate).month ?? 0
    }
}
