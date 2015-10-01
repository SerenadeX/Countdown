//
//  AddTimerViewController.swift
//  Countdown
//
//  Created by Rhett Rogers on 9/28/15.
//  Copyright © 2015 Rhett Rogers. All rights reserved.
//

import UIKit


class AddTimerViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func dismissMe(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTimerAndDismiss(sender: AnyObject) {
        let 🕐 = Timer(title: titleField.text!, date: datePicker.date)
        let info: [NSObject: AnyObject]? = ["timer": 🕐]
        NSNotificationCenter.defaultCenter().postNotificationName("newTimer", object: nil, userInfo: info)
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}