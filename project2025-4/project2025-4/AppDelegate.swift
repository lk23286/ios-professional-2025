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
    var hasOnboarding = false
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .cyan
        window?.rootViewController = loginViewController
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.delegate = self
        
        // window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "hello")
        //window?.rootViewController = OnboardingContainerViewController()
        
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if hasOnboarding {
            window?.rootViewController = dummyViewController
        } else {
            window?.rootViewController = onboardingContainerViewController
        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("Onboarding did finish")
        window?.rootViewController = dummyViewController
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        window?.rootViewController = loginViewController
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
        hasOnboarding = true
    }
    
    
}
