//
//  AppDelegate.swift
//  project2025-6
//
//  Created by Laszlo Kovacs on 2025. 02. 08..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        loginViewController.delegate = self
        dummyViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
       // window?.rootViewController = dummyViewController
       // window?.rootViewController = onboardingContainerViewController
       // window?.rootViewController = OnboardingViewController(heroImageName: "delorean", textName: "delorean")
        
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func login() {
        window?.rootViewController = onboardingContainerViewController
    }
}

extension AppDelegate: logoutDelegate {
    func logout() {
        window?.rootViewController = loginViewController
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didOnboardingFinish() {
        window?.rootViewController = dummyViewController
    }
    
    
}
