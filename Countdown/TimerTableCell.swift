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

    
    func countUp() {
        let now = NSDate(timeIntervalSinceNow: 0)
        let diff: NSTimeInterval = destDate.timeIntervalSince1970 - now.timeIntervalSince1970
        if diff < 0 {

            notifyUser()
            showRemoval()
            
        } else  {

            let division = diff.divideTime()
            var formattedString = ""

            func addTimeString(value: Int, units: String, addSpace: Bool = true, leadingZeros: Bool = false) {
                if formattedString != "" && addSpace && value > 0{
                    formattedString += " "
                }
                
                if leadingZeros {
                    formattedString += "0"
                }
                
                
                if value > 0  || leadingZeros {
                    formattedString += "\(value)\(units)"
                }
            }
            
            addTimeString(division.weeks, units: "w")
            addTimeString(division.days, units: "d")
            addTimeString(division.hours, units: ":", addSpace: true, leadingZeros: division.hours < 10)
            addTimeString(division.minutes, units: ":", addSpace: false, leadingZeros: division.minutes < 10)
            addTimeString(division.seconds, units: "", addSpace: false, leadingZeros: division.seconds < 10)
            time.text = formattedString
        }
    }
    
    func notifyUser() {
        if let 🕐 = timer {
            let not = UILocalNotification()
            not.alertTitle = 🕐.title
            not.alertBody = "\(🕐.title) – Your time is up!"
            UIApplication.sharedApplication().presentLocalNotificationNow(not)
            NSNotificationCenter.defaultCenter().postNotificationName("timerExpired", object: nil, userInfo: ["timer": 🕐])
            

            title.text = "\(🕐.title) – Complete"
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

        removeButton.hidden = true
        time.hidden = false
        
    }
    
    func startTimer(🕐: Timer = Timer(title: "default", date: NSDate(timeIntervalSinceNow: NSTimeInterval(days: 7)))) {

        destDate = 🕐.date
        self.timer = 🕐
        countUp()
        let runLoop = NSRunLoop.currentRunLoop()
        let timer = NSTimer(timeInterval: 1, target: self, selector: "countUp", userInfo: nil, repeats: true)
        
        runLoop.addTimer(timer, forMode: NSDefaultRunLoopMode)
        
    }
    
    
    
}