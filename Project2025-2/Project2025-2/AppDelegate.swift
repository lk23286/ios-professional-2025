//
//  AppDelegate.swift
//  Project2025-2
//
//  Created by Laszlo Kovacs on 2025. 02. 05..
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
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.delegate = self
        
       // window?.rootViewController = onboardingContainerViewController
       // window?.rootViewController = OnboardingViewContainer(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
        
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("did Login")
        //window?.rootViewController = onboardingContainerViewController
        if hasOnboarding {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("foo-Did Finish Onboarding")
        //window?.rootViewController = dummyViewController
        setRootViewController(dummyViewController)
        hasOnboarding = true
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        print("foo-Did Logout")
        //window?.rootViewController = loginViewController
        setRootViewController(loginViewController)
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
        
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
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
}

    
