
//
//  Date.swift
//  TaskIt
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import Foundation
class Date{
    
    class func from (#year:Int, month:Int, day:Int) -> NSDate{
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar?.dateFromComponents(components)
        return date!
    }
    
    class func toString(#date:NSDate) -> String{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        let dateString = formatter.stringFromDate(date)
        return dateString
    }
}