//
//  ViewController.swift
//  Local Notification Demo
//
//  Created by Rohit Pal on 11/08/16.
//  Copyright © 2016 Rohit Pal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 5
    var timer = NSTimer()
    
    @IBOutlet weak var notificationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.notification), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func notification(){
        time -= 1
        if time == 0 {
            let notification = UILocalNotification()
            notification.alertAction = "Open App"
            notification.alertBody = "You have an Local Notification"
            notification.applicationIconBadgeNumber = 1
            notification.soundName = UILocalNotificationDefaultSoundName
            notification.userInfo = [
                "message": "Checkout New notification From Local Notification Demo App" 
            ]
            notification.fireDate = NSDate(timeIntervalSinceNow: 0)
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
            
            timer.invalidate()
        }
        
    }

    @IBAction func createNotification(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.notification), userInfo: nil, repeats: true)
        time = 10
        
        let AlertView = UIAlertController(title: "Alert", message: "Notification is created and will be appearing in 10 seconds!", preferredStyle: UIAlertControllerStyle.Alert)
        AlertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil))
        self.presentViewController(AlertView, animated: true, completion: nil)
        
    }

}

