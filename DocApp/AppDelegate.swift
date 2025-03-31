//
//  AppDelegate.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        self.start(window)
        return true
    }
    
    func start(_ window: UIWindow?){
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start()
        window?.makeKeyAndVisible()
    }
}


