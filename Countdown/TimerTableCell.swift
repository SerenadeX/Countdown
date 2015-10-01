//
//  TimerTableCell.swift
//  Countdown
//
//  Created by Rhett Rogers on 9/25/15.
//  Copyright © 2015 Rhett Rogers. All rights reserved.
//


import UIKit


class TimerTableCell : UITableViewCell {
    
    
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    var timer: Timer?
    var destDate: NSDate = NSDate()
    
    
    
    func countUp() {
        let now = NSDate(timeIntervalSinceNow: 0)
        let diff: NSTimeInterval = destDate.timeIntervalSince1970 - now.timeIntervalSince1970
        if diff < 0 {
            if let 🕐 = timer {
                let not = UILocalNotification()
                not.alertTitle = 🕐.title
                not.alertBody = "Your time is up!"
                UIApplication.sharedApplication().presentLocalNotificationNow(not)
                NSNotificationCenter.defaultCenter().postNotificationName("timerExpired", object: nil, userInfo: ["timer": 🕐])
            }
        } else {
            let division = diff.divideTime()
            time.text = "\(division.weeks) w \(division.days) d \(division.hours):\(division.minutes):\(division.seconds)"
        }
    }
    
    func startTimer(🕐: Timer = Timer(title: "default", date: NSDate(timeIntervalSinceNow: NSTimeInterval(days: 7)))) {
        destDate = 🕐.date
        self.timer = 🕐
        let runLoop = NSRunLoop.currentRunLoop()
        let timer = NSTimer(timeInterval: 1, target: self, selector: "countUp", userInfo: nil, repeats: true)
        
        runLoop.addTimer(timer, forMode: NSDefaultRunLoopMode)

    }
    
    
    
    
}