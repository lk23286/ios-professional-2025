//
//  ViewController.swift
//  Project 15
//
//  Created by Laszlo Kovacs on 2025. 02. 23..
//

import UIKit

class ViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
}

extension ViewController {
    
    private func style() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(SigninTouched), for: .primaryActionTriggered)
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
    }
}

extension ViewController {
    @objc private func SigninTouched() {
    
        print("SigninTouched")}
}
