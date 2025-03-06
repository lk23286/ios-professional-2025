//
//  AppDelegate.swift
//  project2025-3
//
//  Created by Laszlo Kovacs on 2025. 02. 07..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let loginViewController = LoginViewController()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
       // window?.rootViewController = loginViewController
        
        loginViewController.delegate = self
        
        //window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Hello, World!")
        window?.rootViewController = OnboardingContainerViewController()
        return true
    }

}
extension AppDelegate:LoginViewControllerDelegate{
    func login() {
        print("Do Login")
    }
    
    
}

