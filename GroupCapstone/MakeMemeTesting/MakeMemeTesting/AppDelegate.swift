//
//  AppDelegate.swift
//  MakeMemeTesting
//
//  Created by ALIA M NEELY on 7/24/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (isAuthorized, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if isAuthorized {
                UIApplication.shared.registerForRemoteNotifications()
            }
            
        }
        MemeController.shared.fetchMemesFromCLoudKit {}

        return true
    }

    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        MemeController.subscribeToMemeCreations()
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        MemeController.shared.fetchMemesFromCLoudKit {
        }
    }


}

