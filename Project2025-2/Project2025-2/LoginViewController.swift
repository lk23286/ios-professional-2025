//
//  ViewController.swift
//  Project2025-2
//
//  Created by Laszlo Kovacs on 2025. 02. 05..
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = onboardingViewContainer()
    let signInButton = UIButton()
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
}

extension LoginViewController {
    func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle( "Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.text = "Error message"
        errorMessageLabel.isHidden = true
        
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // login view layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        // sign in button layout
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        // error message layout
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
            
    }
    
}

extension LoginViewController {
    @objc func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    func login() {
        guard let username = username, let password = password else {
            assertionFailure("username and password can not be empty")
            return
        }
        
        if username.isEmpty || password.isEmpty {
          configureView(withMessage: "Username and password can not be empty")
            return
        }
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            
        } else {
            configureView(withMessage: "Invalid username or password")
        }
    }
    
    func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
        loginView.passwordTextField.text = ""
        loginView.usernameTextField.text = ""
        loginView.usernameTextField.becomeFirstResponder()
    }
}

