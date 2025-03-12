//
//  loginView.swift
//  Project 9
//
//  Created by Laszlo Kovacs on 2025. 02. 18..
//
import Foundation
import UIKit



class LoginView: UIView {
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividedLineView = UIView()
    let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("Init (coder:) has not been implemented")
    }
    
}

extension LoginView:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""
        {
            return true
        } else {
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        
        dividedLineView.translatesAutoresizingMaskIntoConstraints = false
        dividedLineView.backgroundColor = .systemGray
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividedLineView)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            dividedLineView.heightAnchor.constraint(equalToConstant: 1)
            
            
        ])
    }
}

