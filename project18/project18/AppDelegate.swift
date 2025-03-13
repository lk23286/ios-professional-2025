//
//  AppDelegate.swift
//  project18
//
//  Created by Laszlo Kovacs on 2025. 03. 12..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginVC = LoginVC()
    let onboardingContainerVC = OnboardingContainerVC()
    let dummyVC = DummyVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loginVC.delegate = self
        dummyVC.delegate = self
        onboardingContainerVC.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        window?.rootViewController = loginVC

        return true
    }
}

extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        window?.rootViewController = onboardingContainerVC
    }
}
extension AppDelegate: LogoutDelegate {
    func didLogout() {
        window?.rootViewController = loginVC
    }
}
extension AppDelegate: OnboardingContainerVCDelegate {
    func didOnboarding() {
        window?.rootViewController = dummyVC
    }
    
    
}

