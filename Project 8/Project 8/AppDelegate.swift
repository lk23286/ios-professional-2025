//
//  AppDelegate.swift
//  Project 8
//
//  Created by Laszlo Kovacs on 2025. 02. 17..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let onboardingContainerViewController = OnboardingContainerViewController()
    let loginViewController = LoginViewController()
    let dummyViewController = DummyViewController()
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        onboardingContainerViewController.delegate = self
        dummyViewController.delegate = self
        loginViewController.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        window?.rootViewController = loginViewController
        //window?.rootViewController = onboardingContainerViewController
        //window?.rootViewController = OnboardingViewController()
        //window?.rootViewController = DummyViewController()
        
        return true
    }

}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        setRootViewController(dummyViewController)
        LocalState.hasOnboarding = true
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        print("logout")
        setRootViewController(loginViewController)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("login")
        if LocalState.hasOnboarding {
            setRootViewController(dummyViewController)
            return
        } else {
            setRootViewController(onboardingContainerViewController)
            loginViewController.signInButton.configuration?.showsActivityIndicator = false
       
        }
         }
}

extension AppDelegate {
    func setRootViewController (_ vc:UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 0.7,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil)
    }
}
