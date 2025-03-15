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
    let dummyViewController = DummyViewController()
    let onbordingContainerViewController = OnboardingContainerViewController()
    
    var window: UIWindow?
    var hasOnboarding = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
        //window?.rootViewController = dummyViewController
        
        loginViewController.delegate = self
        dummyViewController.delegate = self
        onbordingContainerViewController.delegate = self
  
        
        //window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Hello, World!")
        //window?.rootViewController = OnboardingContainerViewController()
        return true
    }
}

extension AppDelegate:LoginViewControllerDelegate{
    func didLogin() {
        if hasOnboarding {
            window?.rootViewController = dummyViewController
        } else {
            window?.rootViewController = onbordingContainerViewController
        }
    }
}

extension AppDelegate:LogoutDelegate{
    func didLogout() {
        window?.rootViewController = loginViewController
        loginViewController.signInButton.configuration?.showsActivityIndicator = false 
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate{
    func didFinishOnbouarding() {
        window?.rootViewController = dummyViewController
        hasOnboarding = true
    }
}

