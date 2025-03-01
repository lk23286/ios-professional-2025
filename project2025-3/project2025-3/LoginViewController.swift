//
//  ViewController.swift
//  project2025-3
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
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTouched), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .red
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.text = "Error message"
        errorMessageLabel.isHidden = true
        
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // login view  layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // sign in butoon layout
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
    
    @objc func signInTouched() {
        errorMessageLabel.isHidden = true
        guard let username = username, let password = password else {
            assertionFailure("username / password can't be empty")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Please fill in all fields")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Invalid username or password")
        }
        
    }
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
