//
//  Login.swift
//  project18
//
//  Created by Laszlo Kovacs on 2025. 03. 12..
//

import Foundation
import UIKit

protocol LoginVCDelegate: AnyObject {
    func didLogin()
}

class LoginVC: UIViewController {
    
    let firsLabel = UILabel()
    let secondLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton()
    let errorMessageLabel = UILabel()
    
    var username: String? {
        loginView.usernameTextFiled.text
    }
    
    var password: String? {
        loginView.passwordTextFiled.text
    }
    
    weak var delegate: LoginVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
    

    
}

extension LoginVC {
    
    func style() {
        view.backgroundColor = .systemBackground
        
        //first text label
        firsLabel.translatesAutoresizingMaskIntoConstraints = false
        firsLabel.text = "Bankey"
        firsLabel.font = .systemFont(ofSize: 36, weight: .bold)
        firsLabel.textAlignment = .center
        
        
        // second text label
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = "Your premier source of all things Banking!"
        secondLabel.font = .systemFont(ofSize: 24, weight: .light)
        secondLabel.textAlignment = .center
        secondLabel.numberOfLines = 0
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        // button
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        // error message Label
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .red
        errorMessageLabel.isHidden = true
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.text = "error message"
        
        
    }
    
    func layout() {
        
        view.addSubview(firsLabel)
        view.addSubview(secondLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // first text label
        NSLayoutConstraint.activate([
            firsLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: -24),
            firsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firsLabel.trailingAnchor, multiplier: 1)
        ])
        
        // second text label
        NSLayoutConstraint.activate([
            secondLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24),
            secondLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondLabel.trailingAnchor, multiplier: 1)
        ])
        
        // loginView label
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
        
        // error message label layout
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
        ])
    }
}

extension LoginVC {
    
    @objc func signInTapped() {
        guard let username = username, let password = password else {
            assertionFailure("Can't be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configure("Please fill all fields")
            return
        }
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
            delegate?.didLogin()
            
        } else {
            configure("Please enter correct username and password")
        }
    }
    
    func configure(_ message:String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}

