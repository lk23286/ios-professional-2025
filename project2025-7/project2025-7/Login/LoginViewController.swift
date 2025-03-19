//
//  ViewController.swift
//  project2025-7
//
//  Created by Laszlo Kovacs on 2025. 02. 08..
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}


class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let firsTextLabel = UILabel()
    let secondTextLabel = UILabel()
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
        
        loginView.translatesAutoresizingMaskIntoConstraints = false

        firsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        firsTextLabel.text = "Bankey"
        firsTextLabel.font = .systemFont(ofSize: 36, weight: .bold)
        firsTextLabel.textAlignment = .center
        
        secondTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTextLabel.text = "Your premier source of all things Banking!"
        secondTextLabel.font = .systemFont(ofSize:24)
        secondTextLabel.numberOfLines = 0
        secondTextLabel.textAlignment = .center
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .red
        errorMessageLabel.text = "error message"
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true
        
    }
    
    func layout() {
        
        view.addSubview(firsTextLabel)
        view.addSubview(secondTextLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        // first text label
        NSLayoutConstraint.activate([
            firsTextLabel.bottomAnchor.constraint(equalTo: secondTextLabel.topAnchor, constant: -24),
            firsTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalTo: firsTextLabel.trailingAnchor, constant: 2)
            ])
            
        
        
        //second text label
        NSLayoutConstraint.activate([
            secondTextLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            secondTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondTextLabel.trailingAnchor, multiplier: 2)
  
        ])
        
        // login view
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            ])
        
        // sign in button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // error message label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}
extension LoginViewController {
    @objc func signInTapped() {
        login()
        
    }
    func login() {
        guard let username = username, let password = password else {
            assertionFailure("username and password cannot be empty")
            return
        }
        if username.isEmpty || password.isEmpty {
            configure("Please fill in all fields")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
            errorMessageLabel.isHidden = true
        } else {
            configure( "Invalid username or password")
        }
    }
    func configure(_ message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}
