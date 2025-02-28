//
//  LoginView.swift
//  Project 15
//
//  Created by Laszlo Kovacs on 2025. 02. 23..
//
import Foundation
import UIKit

let usernameTextField = UITextField()
let passwordTextField = UITextField()
let stackView = UIStackView()
let dividerView = UIView()

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("Init (coder:) has not been implemented")
    }

    
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemMint
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .systemGray
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
}

