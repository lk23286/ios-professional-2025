//
//  ViewController.swift
//  Project16
//
//  Created by Laszlo Kovacs on 2025. 02. 27..
//

import UIKit

class ViewController: UIViewController {
    
    let loginView = LoginView()
    let signinButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }


}
extension ViewController {
    func style() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemIndigo
        
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.configuration = .filled()
        signinButton.configuration?.imagePadding = 8
        signinButton.setTitle("Sign in", for: [])
        signinButton.addTarget(self, action: #selector(signInTouched), for: .primaryActionTriggered)
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(signinButton)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signinButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view .trailingAnchor.constraint(equalToSystemSpacingAfter: signinButton.trailingAnchor, multiplier: 1)
        ])
    }
}

extension ViewController {
    @objc func signInTouched() {
        print("Sign in touched")
    }
}
        
