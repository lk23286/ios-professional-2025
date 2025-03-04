//
//  ViewController.swift
//  project2025-4
//
//  Created by Laszlo Kovacs on 2025. 02. 07..
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func  login()
}

class LoginViewController: UIViewController {
    
    
    let firstTextLabel = UILabel()
    let secondTextLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton()
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
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
        view.backgroundColor = .systemBackground
        
        firstTextLabel.translatesAutoresizingMaskIntoConstraints = false
        firstTextLabel.textAlignment = .center
        firstTextLabel.font = .systemFont(ofSize: 36, weight: .bold)
        firstTextLabel.text = "Bankey"
        
        secondTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTextLabel.textAlignment = .center
        secondTextLabel.font = .systemFont(ofSize: 24, weight: .medium)
        secondTextLabel.text = "Your premier source of all things Banking!"
        secondTextLabel.numberOfLines = 0
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(SignInTouched), for: .primaryActionTriggered)
      
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textColor = .red
        errorMessageLabel.text = "Error message placeholder"
        errorMessageLabel.isHidden = true
    }
    
    func layout() {
        view.addSubview(firstTextLabel)
        view.addSubview(secondTextLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        // FirstText layout
        NSLayoutConstraint.activate([
            firstTextLabel.bottomAnchor.constraint(equalTo: secondTextLabel.topAnchor, constant: -24),
            firstTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstTextLabel.trailingAnchor, multiplier: 1)
        ])
        
        //SecondText layout
        NSLayoutConstraint.activate([
            secondTextLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            secondTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondTextLabel.trailingAnchor, multiplier: 1)
            ])
            
        // login view layou
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
            errorMessageLabel.isHidden = true
            delegate?.login()
        } else {
            configurationView(withMessage: "Invalid username or password")
        }
        
        func configurationView(withMessage message: String) {
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = message
        }
    }
    
    
}

