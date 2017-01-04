//
//  AppDelegate.swift
//  HX_demo
//
//  Created by XX on 16/12/29.
//  Copyright © 2016年 XX. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, EMChatManagerDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        //环信初始化
        let options = EMOptions.init(appkey:"1113161221178022#hxdemo")
//        options.apnsCertName = "developer"
        let error = EMClient.sharedClient().initializeSDKWithOptions(options)
        if error == nil {
            print("初始化成功")
        }else{
            print("初始化失败")
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        //APP进入后台
        EMClient.sharedClient().applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        //App即将返回前台
        EMClient.sharedClient().applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

