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
    let loginViewController = LoginViewController()
    
   
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
        
        loginViewController.delegate = self
        
       // window?.rootViewController = OnboardingContainerViewController()
       // window?.rootViewController = OnboardingViewContainer(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
        
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("did Login")
    }
    
    
}
