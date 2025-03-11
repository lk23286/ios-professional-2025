//
//  AppDelegate.swift
//  project2025-7
//
//  Created by Laszlo Kovacs on 2025. 02. 08..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let dummyViewController = DummyViewController()
    let loginViewController = LoginViewController()
    let onboardingContainerViewContainer = OnboardingContainerViewContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        dummyViewController.delegate = self
        loginViewController.delegate = self
        onboardingContainerViewContainer.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemYellow
        window?.rootViewController = loginViewController
       // window?.rootViewController = OnboardingContainerViewContainer()
       // window?.rootViewController = dummyViewController
       // window?.rootViewController = OnboardingViewController()
        return true
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        window?.rootViewController = loginViewController
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        window?.rootViewController = onboardingContainerViewContainer
    }
}

extension AppDelegate: OnboardingContainerViewContainerDelegate {
    func didOnboardingFinish() {
        window?.rootViewController = dummyViewController
    }
    
}
