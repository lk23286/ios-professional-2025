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
        window?.rootViewController = loginViewController
        //window?.rootViewController = onboardingContainerVC
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarding {
            setRootViewController(dummyVC)
        } else {
            setRootViewController(onboardingContainerVC)
        }
    }
}

extension AppDelegate: OnboardingContainerVCDelegate {
    func didOnboarding() {
        LocalState.hasOnboarding = true
        window?.rootViewController = dummyVC
    }
}

extension AppDelegate: logoutDelegate {
    func didLogout() {
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
        setRootViewController(loginViewController)
        
       
        
        
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.7,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil)
        
    }
}
