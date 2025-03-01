//
//  AppDelegate.swift
//  Project17
//
//  Created by Laszlo Kovacs on 2025. 03. 01..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        //window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingContainerViewController()
        //window?.rootViewController = OnboardingViewController()

        return true
    }


}

