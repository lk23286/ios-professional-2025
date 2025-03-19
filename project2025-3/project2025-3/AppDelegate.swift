//
//  AppDelegate.swift
//  project2025-3
//
//  Created by Laszlo Kovacs on 2025. 02. 07..
//
let appColor: UIColor = .systemTeal

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let loginViewController = LoginViewController()
    let dummyViewController = DummyViewController()
    let onbordingContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        //window?.rootViewController = loginViewController
        //window?.rootViewController = dummyViewController
        window?.rootViewController = mainViewController
        
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
        if LocalState.hasOnboarding {
            //window?.rootViewController = dummyViewController
            setRootViewController(dummyViewController)
        } else {
            //window?.rootViewController = onbordingContainerViewController
            setRootViewController(onbordingContainerViewController)
        }
    }
}

extension AppDelegate:LogoutDelegate{
    func didLogout() {
        //window?.rootViewController = loginViewController
        setRootViewController(loginViewController)
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate{
    func didFinishOnbouarding() {
       // window?.rootViewController = dummyViewController
        setRootViewController(dummyViewController)
        LocalState.hasOnboarding = true
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
