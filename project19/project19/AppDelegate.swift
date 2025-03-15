//
//  AppDelegate.swift
//  project19
//
//  Created by Laszlo Kovacs on 2025. 03. 12..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginVC = LoginVC()
    let onboardingContainerVC = OnboardingContainerVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loginVC.delegate = self
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        window?.rootViewController = loginVC
        
        return true
    }
}

extension
AppDelegate: LoginVCDelegate {
    
    func didLogin() {
        window?.rootViewController = onboardingContainerVC
    }
}
                
    

