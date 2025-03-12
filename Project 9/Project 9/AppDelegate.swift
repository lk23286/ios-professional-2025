//
//  AppDelegate.swift
//  Project 9
//
//  Created by Laszlo Kovacs on 2025. 02. 18..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerVC = OnboardingContainerVC()
    let dummyVC = DummyVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loginViewController.delegate = self
        onboardingContainerVC.delegate = self
        dummyVC.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        //window?.rootViewController = loginViewController
        window?.rootViewController = onboardingContainerVC
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        window?.rootViewController = onboardingContainerVC
    }
}

extension AppDelegate: OnboardingContainerVCDelegate {
    func didOnboarding() {
        window?.rootViewController = dummyVC
    }
}

extension AppDelegate: logoutDelegate {
    func didLogout() {
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
        window?.rootViewController = loginViewController
        loginViewController.loginView.usernameTextField.text = ""
        loginViewController.loginView.passwordTextField.text = ""
        
        
    }
}
