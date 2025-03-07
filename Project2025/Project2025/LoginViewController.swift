//
//  ViewController.swift
//  Project2025
//
//  Created by Laszlo Kovacs on 2025. 02. 02..
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}



class LoginViewController: UIViewController {
    
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLable = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextFied.text
    }
    
    var password: String? {
        return loginView.passwordTextFied.text
    }

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

extension LoginViewController {
    private func style() {
        
        view.backgroundColor = .systemBackground
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.textAlignment = .center
        firstLabel.numberOfLines = 0
        firstLabel.font = .systemFont(ofSize: 36, weight: .bold)
        firstLabel.text = "Bankey"
        
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.textAlignment = .center
        secondLabel.numberOfLines = 0
        secondLabel.font = .systemFont(ofSize: 24, weight: .medium)
        secondLabel.text = "Your premier source of all things Banking!"
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLable.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLable.textAlignment = .center
        errorMessageLable.textColor = .systemRed
        errorMessageLable.numberOfLines = 0
        errorMessageLable.text = "Error failure"
        errorMessageLable.isHidden = true
    }
    
    private func layout() {
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLable)
        
        // first label layout
        NSLayoutConstraint.activate([
            firstLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: -30),
            
            firstLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstLabel.trailingAnchor, multiplier: 1)
            ])
        
        
        // second label layout
        NSLayoutConstraint.activate([
            secondLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -30),
           
            secondLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: secondLabel.trailingAnchor, multiplier: 1)
        ])
        
        // sign in text
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            //signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 48),
        ])
        
        // button layout
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // error messagel label
        NSLayoutConstraint.activate([
            errorMessageLable.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLable.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLable.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
    

}
//MARK: Actions
extension LoginViewController {
    @objc private func signInTapped() {
        errorMessageLable.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username/Password hould never be empty")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username/Password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLable.text = message
        errorMessageLable.isHidden = false
    }
}
