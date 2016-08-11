//
//  AppDelegate.swift
//  Local Notification Demo
//
//  Created by Rohit Pal on 11/08/16.
//  Copyright © 2016 Rohit Pal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let tintColor = UIColor(red: 252/255, green: 72/255, blue: 49/255, alpha: 1)
        window!.tintColor = tintColor
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes:[.Alert,.Badge,.Sound], categories: nil))
        return true
    }

    func application(application:UIApplication, didReceiveLocalNotification notification:UILocalNotification){
        if application.applicationState == .Active{
            self.takeActiveActionNotification(notification)
        } else{
            self.takeInactiveActionNotification(notification)
        }
    }
    
    func takeActiveActionNotification(localNotification: UILocalNotification) {
        let notificationMessage =  localNotification.userInfo!["message"] as! String
        let alertController = UIAlertController(title: "Hey there!", message: notificationMessage, preferredStyle: .Alert)
        let remindMeLaterAction = UIAlertAction(title: "Remind me later!", style: .Default, handler: nil)
        let sureAction = UIAlertAction(title: "Sure", style: .Default) { (action) -> Void in
             print("User is interested in notification")
        }
        alertController.addAction(remindMeLaterAction)
        alertController.addAction(sureAction)
        self.window?.rootViewController?.presentViewController(alertController , animated: true, completion: nil)
    }
    
    
    func takeInactiveActionNotification(localNotification: UILocalNotification) {
        
        let AlertView = UIAlertController(title: "Alert", message: "You pushed me to background! Here! You are", preferredStyle: UIAlertControllerStyle.Alert)
        AlertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil))
        self.window?.rootViewController?.presentViewController(AlertView, animated: true, completion: nil)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

