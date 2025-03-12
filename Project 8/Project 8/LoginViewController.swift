//
//  ViewController.swift
//  Project 8
//
//  Created by Laszlo Kovacs on 2025. 02. 17..
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
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
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
        firstLabel.text = "Bankey"
        firstLabel.font = .systemFont(ofSize: 36)
        firstLabel.textAlignment = .center
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = "Your premier source of all things Banking!"
        secondLabel.font = .systemFont(ofSize: 24)
        secondLabel.textAlignment = .center
        secondLabel.numberOfLines = 0
        
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(loginButtonTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .red
       // errorMessageLabel.font = .systemFont(ofSize: 14)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true
        errorMessageLabel.text = "error message"
        
    }
    
    private func layout() {
        
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // first label
        NSLayoutConstraint.activate([
            firstLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: -28),
            firstLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstLabel.trailingAnchor, multiplier: 1)
           ])
        
        
        // second label
        NSLayoutConstraint.activate([
            secondLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -28),
            secondLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondLabel.trailingAnchor, multiplier: 1)
           ])
        // loginview layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
        ])
        
        // sign in button layout
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        
        // error message label
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
        ])
    }
    
}

extension LoginViewController {
    
    @objc private func loginButtonTapped() {
        guard let username = username, let password = password else {
            assertionFailure("username and password should not be nil")
            return
        }
        if username.isEmpty || password.isEmpty {
            configure("Please enter username and password")
            return
        }
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
            delegate?.didLogin()
            
        } else {
            configure( "Invalid username or password")
            
        }
    }
    func configure(_ message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = message.isEmpty
    }
}
