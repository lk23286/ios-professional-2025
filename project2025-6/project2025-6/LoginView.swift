//
//  LoginView.swift
//  project2025-6
//
//  Created by Laszlo Kovacs on 2025. 02. 08..
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
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGreen
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        dividerView.backgroundColor = .systemRed
    }
    
    func layout() {
        
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
                
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
}

