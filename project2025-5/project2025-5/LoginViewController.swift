//
//  ViewController.swift
//  project2025-5
//
//  Created by Laszlo Kovacs on 2025. 02. 07..
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func login()
}

class LoginViewController: UIViewController {
    
    let firstTextLabel = UILabel()
    let secondTextLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton()
    let erroMessageLabel = UILabel()
    
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
        firstTextLabel.text = "Bankey"
        firstTextLabel.textAlignment = .center
        firstTextLabel.font = .systemFont(ofSize: 36, weight: .bold)
        
        secondTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTextLabel.text = "Your premier source of all things Banking!"
        secondTextLabel.textAlignment = .center
        secondTextLabel.numberOfLines = 0
        secondTextLabel.font = .systemFont(ofSize: 24 )
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        erroMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        erroMessageLabel.textColor = .red
        erroMessageLabel.textAlignment = .center
        erroMessageLabel.numberOfLines = 0
        erroMessageLabel.isHidden = true
        erroMessageLabel.text = "error message"
    
    }
    
    func layout() {
        view.addSubview(firstTextLabel)
        view.addSubview(secondTextLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(erroMessageLabel)
        
        //first
        NSLayoutConstraint.activate([
            firstTextLabel.bottomAnchor.constraint(equalTo: secondTextLabel.topAnchor, constant: -24),
            firstTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstTextLabel.trailingAnchor, multiplier: 1)
        ])
        
        // second
        NSLayoutConstraint.activate([
            secondTextLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            secondTextLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondTextLabel.trailingAnchor, multiplier: 1)
            ])
       
        // loginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
       
        //Sign in button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // error message label
        NSLayoutConstraint.activate([
            erroMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            erroMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            erroMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
    }
}

extension LoginViewController {
    
    @objc func signInTapped() {
        login()
        
    }
    func login() {
        erroMessageLabel.isHidden = true
        guard let username = username, let password = password else {
            assertionFailure("Can't be empty")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configurationView(withMessage: "Username or password can't be empty")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.login()
        } else {
            configurationView(withMessage: "Username or password is incorrect")
        }
    }
    
    func configurationView(withMessage message:String) {
        erroMessageLabel.isHidden = false
        erroMessageLabel.text = message
    }
}
