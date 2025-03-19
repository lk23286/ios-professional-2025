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
        setRootViewController(loginViewController)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        setRootViewController(onboardingContainerViewContainer)
        loginViewController.signInButton.configuration?.showsActivityIndicator = false
        if LocalState.hasOnboarding {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingContainerViewContainer)
        }
    }
}

extension AppDelegate: OnboardingContainerViewContainerDelegate {
    func didOnboardingFinish() {
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
        completion: nil
      )
    }
}
