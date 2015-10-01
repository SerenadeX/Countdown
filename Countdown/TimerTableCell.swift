//
//  TimerTableCell.swift
//  Countdown
//
//  Created by Rhett Rogers on 9/25/15.
//  Copyright © 2015 Rhett Rogers. All rights reserved.
//


import UIKit


class TimerTableCell : UITableViewCell {
    
    
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    var timer: Timer?
    var destDate: NSDate = NSDate()
    var parent: TimerTableViewController?
    var finished = false
    
    func countUp() {
        let now = NSDate(timeIntervalSinceNow: 0)
        let diff: NSTimeInterval = destDate.timeIntervalSince1970 - now.timeIntervalSince1970
        if diff < 0 && !finished {
            finished = true
            notifyUser()
            showRemoval()
            
        } else if !finished {

            let division = diff.divideTime()
            time.text = "\(division.weeks) w \(division.days) d \(division.hours):\(division.minutes):\(division.seconds)"
        }
    }
    
    func notifyUser() {
        if let 🕐 = timer {
            let not = UILocalNotification()
            not.alertTitle = 🕐.title
            not.alertBody = "\(🕐.title) – Your time is up!"
            UIApplication.sharedApplication().presentLocalNotificationNow(not)
            NSNotificationCenter.defaultCenter().postNotificationName("timerExpired", object: nil, userInfo: ["timer": 🕐])
            🕐.title = "\(🕐.title) – Complete"
        }
    }
    
    func showRemoval() {
        removeButton.hidden = false
        time.hidden = true
    }
    
    @IBAction func removeTimer(sender: UIButton) {
        if let 👪 = parent {
            if let 🕐 = timer {
                👪.removeTimer(timer: 🕐)
            }
        }
        finished = false
        removeButton.hidden = true
        time.hidden = false
        
    }
    
    func startTimer(🕐: Timer = Timer(title: "default", date: NSDate(timeIntervalSinceNow: NSTimeInterval(days: 7)))) {

        destDate = 🕐.date
        self.timer = 🕐
        let runLoop = NSRunLoop.currentRunLoop()
        let timer = NSTimer(timeInterval: 1, target: self, selector: "countUp", userInfo: nil, repeats: true)
        
        runLoop.addTimer(timer, forMode: NSDefaultRunLoopMode)
        
    }
    
    
    
}