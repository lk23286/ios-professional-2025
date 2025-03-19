//
//  ViewController.swift
//  Project 9
//
//  Created by Laszlo Kovacs on 2025. 02. 18..
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton()
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let errorMessageLabel = UILabel()
    
    var username: String? {
        loginView.usernameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }
    
    weak var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    private func style() {
        
        view.backgroundColor = .systemBackground
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.font = .systemFont(ofSize: 36, weight: .medium)
        firstLabel.textAlignment = .center
        firstLabel.text = "Bankey"
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.font = .systemFont(ofSize: 24, weight: .light)
        secondLabel.textAlignment = .center
        secondLabel.numberOfLines = 0
        secondLabel.text = "Your premier source of all things Banking!"
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        //errorMessageLabel.font = .systemFont(ofSize: 14, weight: .light)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .red
        errorMessageLabel.isHidden = true
       
        
    }
    
    private func layout() {
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // first test label
        NSLayoutConstraint.activate([
            firstLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: -24),
            firstLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstLabel.trailingAnchor, multiplier: 1)
        ])
        
        
        // second text label
        NSLayoutConstraint.activate([
            secondLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            secondLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondLabel.trailingAnchor, multiplier: 1)
        ])
        
        // login view layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        // sign in button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
            
        ])
        
        //error message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
        ])
    }
}

extension LoginViewController {
    @objc private func signInTapped() {
        guard let username = username, let password = password else {
            assertionFailure("Can't sign in with empty credentials")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configure("Please enter both username and password")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            errorMessageLabel.isHidden = true
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configure( "Invalid username or password")
        }
    }
    
    func configure(_ message:String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
