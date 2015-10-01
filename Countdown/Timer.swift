//
//  Timer.swift
//  Countdown
//
//  Created by Rhett Rogers on 9/28/15.
//  Copyright © 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class Timer: NSObject {
    var title: String
    var date: NSDate
    
    init(title t: String, date d: NSDate) {
        title = t
        date = d
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let t = aDecoder.decodeObjectForKey("title") as? String {
            title = t
        } else {
            title = ""
        }
        
        if let d = aDecoder.decodeObjectForKey("date") as? NSDate{
            date = d
        } else {
            date = NSDate(timeIntervalSinceNow: 0)
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")

        aCoder.encodeObject(date, forKey: "date")
    }
    
}
