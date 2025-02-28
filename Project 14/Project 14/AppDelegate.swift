//
//  AppDelegate.swift
//  Project 14
//
//  Created by Laszlo Kovacs on 2025. 02. 22..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemMint
        window?.rootViewController = ViewController()
        
        return true
    }
}

