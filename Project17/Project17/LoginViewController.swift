//
//  ViewController.swift
//  Project17
//
//  Created by Laszlo Kovacs on 2025. 03. 01..
//

import UIKit

class LoginViewController: UIViewController {
    
    let firstTextLabel = UILabel()
    let secondTextLabel = UILabel()
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
    
    private func style() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        firstTextLabel.translatesAutoresizingMaskIntoConstraints = false
        firstTextLabel.text = "Bankey"
        firstTextLabel.font = .systemFont(ofSize: 32, weight: .bold)
        firstTextLabel.textAlignment = .center
        
        secondTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTextLabel.text = "Your premier source of all things Banking!"
        secondTextLabel.font = .systemFont(ofSize: 24, weight: .bold)
        secondTextLabel.numberOfLines = 0
        secondTextLabel.textAlignment = .center
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(singInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .red
        errorMessageLabel.font = .systemFont(ofSize: 17, weight: .regular)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true
        errorMessageLabel.text = "error message"
        
    }
    
    private func layout() {
        
        view.addSubview(firstTextLabel)
        view.addSubview(secondTextLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // first text layout
        NSLayoutConstraint.activate([
            firstTextLabel.bottomAnchor.constraint(equalTo: secondTextLabel.topAnchor, constant: -24),
            firstTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier:  1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstTextLabel.trailingAnchor, multiplier: 1)
        ])
        
        //second text layout
        NSLayoutConstraint.activate([
            secondTextLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            secondTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier:  1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondTextLabel.trailingAnchor, multiplier: 1)
        ])
        
        
        // login view layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // sign in button layout
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        
        //error message label layout
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
            ])
    }
}

extension LoginViewController {
    
    @objc private func singInTapped() {
        guard let username = username, let password = password else {
            configureView(withMessage: "Please fill in all fields")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Please fill in all fields")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
            
        } else {
            configureView(withMessage: "Invalid username or password")
        }
    }
    
    func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}
