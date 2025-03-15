//
//  ViewController.swift
//  project19
//
//  Created by Laszlo Kovacs on 2025. 03. 12..
//

import UIKit

protocol LoginVCDelegate: AnyObject {
    func didLogin()
}

class LoginVC: UIViewController {
    
    let firstLineTextLabel = UILabel()
    let secondLineTextLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton()
    let errorMessageLabel = UILabel()
    
    var userName: String? {
        loginView.usernameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }

    weak var delegate: LoginVCDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
    
}

extension LoginVC {
    private func style() {
        
        view.backgroundColor = .systemBackground
        
        firstLineTextLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLineTextLabel.text = "Bankey"
        firstLineTextLabel.font = .systemFont(ofSize: 36, weight: .medium)
        firstLineTextLabel.textAlignment = .center
        
        secondLineTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLineTextLabel.text = "Your premier source of all things Banking!"
        secondLineTextLabel.font = .systemFont(ofSize: 24)
        secondLineTextLabel.textAlignment = .center
        secondLineTextLabel.numberOfLines = 0
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        //errorMessageLabel.font = .systemFont(ofSize: 18)
        errorMessageLabel.textColor = .red
        
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true
        errorMessageLabel.text = "error"
    }
    
    private func layout() {
        view.addSubview(firstLineTextLabel)
        view.addSubview(secondLineTextLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        // first text label
        NSLayoutConstraint.activate([
            firstLineTextLabel.bottomAnchor.constraint(equalTo: secondLineTextLabel.topAnchor, constant: -24),
            firstLineTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstLineTextLabel.trailingAnchor, multiplier: 1)
            ])
        
        // Secondary Text label
        NSLayoutConstraint.activate([
            secondLineTextLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            secondLineTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondLineTextLabel.trailingAnchor, multiplier: 1)
           ])
        
        
        // login view
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            ])
        
        // sign in button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 16),
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

extension LoginVC {
    @objc private func signInTapped() {
        login()
    }
    func login() {
        guard let userName = userName, let password = password else {
            assertionFailure("Not all fields are filled")
            return }
        
        if userName.isEmpty || password.isEmpty {
            configure("Please fill all fields")
            return
        }
        
        if userName == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }
            else {
                configure("Invalid username or password")
            }
                
    }
    func configure(_ message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
        
    }
}
