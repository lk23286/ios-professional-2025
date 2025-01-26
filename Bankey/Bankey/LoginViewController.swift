//
//  ViewController.swift
//  Bankey
//
//  Created by Laszlo Kovacs on 2025. 01. 20..
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
    let titleTextLabel = UILabel()
    let subtitleTextLabel = UILabel()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()

    

    
    var username: String? {
        return loginView.usernameTextFiled.text
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
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTextLabel.textAlignment = .center
        titleTextLabel.textColor = .black
        titleTextLabel.text = "Bankey"
        titleTextLabel.font = .systemFont(ofSize: 36, weight: .bold)
 
        subtitleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleTextLabel.textAlignment = .center
        subtitleTextLabel.textColor = .black
        subtitleTextLabel.numberOfLines = 0
        subtitleTextLabel.text = "Your premier source of all things banking"
        subtitleTextLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Invalid credentials"
        errorMessageLabel.isHidden = false
        

    }
    
    private func layout() {
        
        view.addSubview(loginView)
        view.addSubview(titleTextLabel)
        view.addSubview(subtitleTextLabel)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // titleText
        NSLayoutConstraint.activate([
            titleTextLabel.bottomAnchor.constraint(equalTo: subtitleTextLabel.topAnchor, constant: -24),
            titleTextLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleTextLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        
        // subtitleText
        NSLayoutConstraint.activate([
            subtitleTextLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            subtitleTextLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subtitleTextLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        
       // sign in text
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 24)
        ])
        
       
        
      // button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        // error message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
    }
}
// MARK: Action
extension LoginViewController {
    
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
        private func login() {
            guard let username = username, let password = password else {
                assertionFailure("Missing required fields")
                return
            }
            
            if username.isEmpty || password.isEmpty {
                configureView(withMessage: "Username and password are required")
            }
            if username == "Kevin" && password == "Welcome" {
                signInButton.configuration?.showsActivityIndicator = true
            } else {
                configureView(withMessage: "Incorrect user name or password")
            }
        }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }


}



