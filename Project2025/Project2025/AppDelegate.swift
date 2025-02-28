//
//  AppDelegate.swift
//  Project2025
//
//  Created by Laszlo Kovacs on 2025. 02. 02..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBrown
        window?.rootViewController = LoginViewController()
     // window?.rootViewController = MultiplePagesContainerViewController()
     // window?.rootViewController = OnboardingViewController()
        
        
        return true
    }


}



