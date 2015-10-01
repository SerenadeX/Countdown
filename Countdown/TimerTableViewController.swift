//
//  TimerTableViewController.swift
//  Countdown
//
//  Created by Rhett Rogers on 9/25/15.
//  Copyright © 2015 Rhett Rogers. All rights reserved.
//

import UIKit

class TimerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var timers = [Timer]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let data = defaults.valueForKey("timers") as? NSData {
            if let t = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Timer] {
                timers = t
            }
        }

        NSNotificationCenter.defaultCenter().addObserverForName("newTimer", object: nil, queue: nil) { (📁) -> Void in
            self.updateTimers(notification: 📁)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateTimers(notification 📁: NSNotification?) {
        if let info = 📁?.userInfo {
            if let 🕐 = info["timer"] as? Timer{
                timers.append(🕐)
            }
        }
        
        let d = NSUserDefaults.standardUserDefaults()
        let data = NSKeyedArchiver.archivedDataWithRootObject(timers)
        d.setValue(data, forKey: "timers")
        tableView.reloadData()

    }

    func removeTimer(timer 🕐: Timer) {
        if let index = timers.indexOf(🕐) {
            timers.removeAtIndex(index)
        }
        
        updateTimers(notification: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timerCell") as? TimerTableCell
        if let c = cell {
            let 🕐 = timers[indexPath.item]
            c.startTimer(🕐)
            c.parent = self
            
            c.title.text = 🕐.title
            return c
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timers.count
    }
    
    
    
}

