//
//  AppDelegate.swift
//  Utility Demo
//
//  Created by Iftekhar on 12/02/21.
//

import UIKit
import IQUtility

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let date: Date = Date()
        if #available(iOS 10.0, *) {
            print("startOfDay:\(date.startOfDay.description(with: Locale.current))")
            print("endOfDay:\(date.endOfDay.description(with: Locale.current))")
            print("startOfMonth:\(date.startOfMonth.description(with: Locale.current))")
            print("endOfMonth:\(date.endOfMonth.description(with: Locale.current))")
            print("startOfWeek:\(date.startOfWeek.description(with: Locale.current))")
            print("endOfWeek:\(date.endOfWeek.description(with: Locale.current))")
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}
