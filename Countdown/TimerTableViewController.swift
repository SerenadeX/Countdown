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
        updateDefaults()
        tableView.reloadData()

    }

    func updateDefaults() {
        let d = NSUserDefaults.standardUserDefaults()
        let data = NSKeyedArchiver.archivedDataWithRootObject(timers)
        d.setValue(data, forKey: "timers")
        
    }
    
    func removeTimer(timer 🕐: Timer) {
        if let index = timers.indexOf(🕐) {
            timers.removeAtIndex(index)

            tableView.deleteRowsAtIndexPaths([NSIndexPath(forItem: index, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Automatic)
            updateDefaults()
        }
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
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
            let 🚛 = UITableViewRowAction(style: .Default, title: "Remove") { (action, index) -> Void in
                self.removeTimer(timer: self.timers[index.item])
            }
            
            🚛.backgroundColor = UIColor.redColor()
            
            return [🚛]
    }

    func showTooManyTimersAlert() {
        let alert = UIAlertController(title: "Too many alerts", message: "You can't have more than 100 alerts", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func openAddTimerView(sender: AnyObject) {
        if timers.count >= 100 {
            showTooManyTimersAlert()
        } else {
            performSegueWithIdentifier("openAddTimerView", sender: self)
        }
        
        
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle:UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        
//    }
    
}

