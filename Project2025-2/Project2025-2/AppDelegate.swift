//
//  AppDelegate.swift
//  Project2025-2
//
//  Created by Laszlo Kovacs on 2025. 02. 05..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        //window?.rootViewController = ViewController()
       // window?.rootViewController = MultiplePagesContainerViewController()
        window?.rootViewController = OnboardingViewContainer()
        
        return true
    }

}

