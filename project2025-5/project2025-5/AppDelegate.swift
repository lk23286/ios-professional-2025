//
//  AppDelegate.swift
//  project2025-5
//
//  Created by Laszlo Kovacs on 2025. 02. 07..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        window?.rootViewController = loginViewController
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.delegate = self
        
        
       // window?.rootViewController = OnboardingViewController(heroImageName: "world", titleText: "hah")
     //   window?.rootViewController = OnboardingContainerViewController()
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func login() {
        print("Do Login")
        window?.rootViewController = onboardingContainerViewController
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("Did Finish Onboarding")
        window?.rootViewController = dummyViewController
    }
}
extension AppDelegate: logoutDelegate {
    func logout() {
        print("Did Logout")
        window?.rootViewController = loginViewController
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
    }
}
