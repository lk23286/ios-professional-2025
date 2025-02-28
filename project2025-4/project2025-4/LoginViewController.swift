//
//  ViewController.swift
//  project2025-4
//
//  Created by Laszlo Kovacs on 2025. 02. 07..
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
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
        view.backgroundColor = .systemMint
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(SignInTouched), for: .primaryActionTriggered)
        // Modern configuration for button appearance (iOS 15+)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemGray // Set button background color
        config.baseForegroundColor = .white       // Set text color
        signInButton.configuration = config
        self.view.addSubview(signInButton)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textColor = .red
        errorMessageLabel.text = "Error message placeholder"
        errorMessageLabel.isHidden = false
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
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // error message layout
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func SignInTouched() {
        login()
    }
    
    func login() {
        guard let username = username, let password = password else {
            assertionFailure("Missing required fields")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configurationView(withMessage: "Please fill all fields")
            return 
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configurationView(withMessage: "Invalid username or password")
        }
        
        func configurationView(withMessage message: String) {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = message
        }
    }
    
    
}

