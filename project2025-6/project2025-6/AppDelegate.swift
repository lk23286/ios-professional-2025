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
    func didLogin() {
          setRootViewController(onboardingContainerViewController)
    }
}

extension AppDelegate: logoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didOnboardingFinish() {
        setRootViewController(dummyViewController)
    }
}

extension AppDelegate {
   func setRootViewController(_ vc: UIViewController, animated:Bool = true) {
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
