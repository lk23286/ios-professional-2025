//
//  AppDelegate.swift
//  project2025-4
//
//  Created by Laszlo Kovacs on 2025. 02. 07..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .cyan
        //window?.rootViewController = LoginViewController()
        // window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "hello")
        window?.rootViewController = OnboardingContainerViewController()
        
        return true
    }

}

