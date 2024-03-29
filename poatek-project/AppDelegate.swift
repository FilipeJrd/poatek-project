//
//  AppDelegate.swift
//  poatek-project
//
//  Created by Filipe Jordão on 21/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]?
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions
        ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController =  TabBarController()
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
