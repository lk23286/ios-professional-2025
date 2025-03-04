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
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBrown
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
       // window?.rootViewController = loginViewController
         window?.rootViewController = onboardingContainerViewController
    //  window?.rootViewController = OnboardingViewController(heroImage: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
        
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("foo- Did login")
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("foo- Did finish onboarding")
    }
}


