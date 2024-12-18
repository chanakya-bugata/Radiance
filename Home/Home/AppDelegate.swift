//
//  AppDelegate.swift
//  Home
//
//  Created by admin12 on 07/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray // Change the color of unselected items
        UITabBar.appearance().tintColor = UIColor(red: 242/255, green: 141/255, blue: 134/255, alpha: 1) // Change the color of selected items
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let onboardingVC = storyboard.instantiateViewController(withIdentifier: "OnBoardingViewController") as? OnBoardingViewController {
            
            // Set it as the root view controller
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = onboardingVC
            window?.makeKeyAndVisible()
            
            // Optional delay if needed
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // Logic for any animation or further transition can go here
            }
        }


        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

