//
//  AppDelegate.swift
//  Practice_Hinderance
//
//  Created by Syed Arisha on 08/11/2019.
//  Copyright © 2019 Syed Arisha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//         CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
//            NULL, // observer
//          displayStatusChangedCallback, // callback
//            "com.apple.iokit.hid.displayStatus" as! CFString, // event name
//            NULL, // object
//            CFNotificationSuspensionBehavior);
//        registerforDeviceLockNotif()
//
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
registerforDeviceLockNotif()
        
        UIApplication.shared.open((NSURL(string: "showHome" as String)! as URL))
        print("yes")
        let alert = UIAlertController(title: nil, message: "Dont Close", preferredStyle: UIAlertController.Style.alert)
//        self.window?.rootViewController?.show(<#T##vc: UIViewController##UIViewController#>, sender: <#T##Any?#>)(alert,animated: true,completion: nil)
        alert.show((UIApplication.shared.keyWindow?.rootViewController)!, sender: Any?.self)
        
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        let alert = UIAlertController(title: nil, message: "Dont Close", preferredStyle: UIAlertController.Style.alert)
        //        self.window?.rootViewController?.show(<#T##vc: UIViewController##UIViewController#>, sender: <#T##Any?#>)(alert,animated: true,completion: nil)
        alert.show((self.window?.rootViewController)!, sender: Any?.self)
        
        
    }
    
    //  Converted to Swift 5 by Swiftify v5.0.40498 - https://objectivec2swift.com/
    let callback: CFNotificationCallback = { center, observer, name, object, info in
        //works fine
    
        //Attribute can only be applied to types, not declarations.
    
        // the "com.apple.springboard.lockcomplete" notification will always come after the "com.apple.springboard.lockstate" notification
        
        let lockState = name as? String
        if let name = name {
            print("Darwin notification NAME = \(name)")
        }
        
        if (lockState == "com.apple.springboard.lockcomplete") {
            print("DEVICE LOCKED")
        } else {
            print("LOCK STATUS CHANGED")
        }
    }
    
    
    func registerforDeviceLockNotif() {
        //Screen lock notifications
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),  /*center */nil,  /* observer */callback,  /* callback */"com.apple.springboard.lockcomplete" as CFString,  /* event name */nil,  /* object */CFNotificationSuspensionBehavior.deliverImmediately)
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),  /*center */nil,  /* observer */callback,  /* callback */"com.apple.springboard.lockstate" as CFString,  /* event name */nil,  /* object */CFNotificationSuspensionBehavior.deliverImmediately)
        print("device locked")
    }


}

