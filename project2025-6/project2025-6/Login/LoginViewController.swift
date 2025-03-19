//
//  ViewController.swift
//  project2025-6
//
//  Created by Laszlo Kovacs on 2025. 02. 08..
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

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
    
    weak var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
}

extension LoginViewController {
    func style() {
        view.backgroundColor = .systemBackground
        
        firstTextLabel.translatesAutoresizingMaskIntoConstraints = false
        firstTextLabel.font = .systemFont(ofSize: 36, weight: .bold)
        firstTextLabel.textAlignment = .center
        firstTextLabel.text = "Bankey"
        
        secondTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTextLabel.font = .systemFont(ofSize: 24)
        secondTextLabel.textAlignment = .center
        secondTextLabel.numberOfLines = 0
        secondTextLabel.text = "Your premier source of all things Banking!"
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(SignInTouched), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.font = .systemFont(ofSize: 18, weight: .medium)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true
        errorMessageLabel.text = "error message"
        errorMessageLabel.textColor = .red
        
    }
    func layout() {
        view.addSubview(firstTextLabel)
        view.addSubview(secondTextLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            firstTextLabel.bottomAnchor.constraint(equalTo: secondTextLabel.topAnchor, constant: -24),
            firstTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstTextLabel.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            secondTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            secondTextLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondTextLabel.trailingAnchor, multiplier: 1)
            ])
        
        // login view layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            
        ])
       // sign in button pressed layout
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // error message label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 24),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
            ])
    }
}

extension LoginViewController {
    @objc func SignInTouched() {
        login()
    }
    
    func login() {
        guard let username = username, let password = password else {
            assertionFailure("No username and password")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configurationView(withMessage: "Please fill in all fields")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
            delegate?.didLogin()
            
            
        } else {
            configurationView(withMessage: "Invalid username or password")
        }
    }
    
    func configurationView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
