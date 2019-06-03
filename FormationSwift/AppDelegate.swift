//
//  AppDelegate.swift
//  FormationSwift
//
//  Created by MacBook on 5/21/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import UIKit

class RefCount {
    deinit {
        debugPrint("deinit called")
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var test1 = RefCount()
    var test2: RefCount!
    var test3: RefCount!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        exercise2()
        
//        debugPrint("\(CFGetRetainCount(test1))")
//        test2 = test1
//        debugPrint("\(CFGetRetainCount(test1))")
//        test3 = test1
//        debugPrint("\(CFGetRetainCount(test1))")
//        
//        test2 = nil
//        debugPrint("\(CFGetRetainCount(test1))")
//        test3 = nil
//        debugPrint("\(CFGetRetainCount(test1))")
        
//        for i in 0..<10 {
//            testRetainCycle()
//        }
        
//        for i in 0..<10 {
//            testRetainStructs()
//        }
        
//        for i in 0..<10 {
//            testRetainWeak()
//        }
        
//        let example = ClosureExample()
        
//        testExcercise2()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

