//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var seconds = 55604

var newSeconds = 5604 % 60
seconds -= newSeconds
seconds /= 60
var minutes = (seconds % 60)
seconds -= minutes
seconds /= 60
var hours = seconds % 24
seconds -= hours
seconds /= 24

newSeconds
minutes
hours



extension NSTimeInterval {
    init(days: Double) {
        self = (days * 24 * 60 * 60) as NSTimeInterval
    }
    func divideTime() -> (years: Int, weeks: Int, days: Int, hours: Int, minutes: Int, seconds: Int){
        var orig = self as Double
        
        var seconds, minutes, hours, days, weeks, years: Int
        func upscale(original: Double, scale: Double) -> (Int, Double) {
            let ret = Int(original % scale)
            var newOrig = original - Double(ret)
            newOrig /= scale
            return (ret, newOrig)
        }
        
        
        (seconds, orig) = upscale(orig, scale: 60)
        (minutes, orig) = upscale(orig, scale: 60)
        (hours, orig) = upscale(orig, scale: 24)
        (days, orig) = upscale(orig, scale: 7)
        (weeks, orig) = upscale(orig, scale: 52)
        (years, orig) = upscale(orig, scale: 1)
        
        return (years: years, weeks: weeks, days: days, hours: hours, minutes: minutes, seconds: seconds)
    }
}


let a:NSTimeInterval = 1234560

var 😁 = a.description
var b = NSTimeInterval(😁)

var titleField = UITextField()
titleField.text!

