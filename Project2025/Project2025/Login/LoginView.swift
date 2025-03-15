//
//  LoginView.swift
//  Project2025
//
//  Created by Laszlo Kovacs on 2025. 02. 05..
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let usernameTextFied = UITextField()
    let passwordTextFied = UITextField()
    let stackView = UIStackView()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("Init (coder:) has not been implemented")
    }
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200, height: 200)
//    }
    
}
// MARK - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextFied.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
func textFieldDidEndEditing(_ textField: UITextField) {
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray5
        
        usernameTextFied.translatesAutoresizingMaskIntoConstraints = false
        usernameTextFied.placeholder = "Username"
        usernameTextFied.delegate = self
        
        passwordTextFied.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFied.placeholder = "Password"
        passwordTextFied.isSecureTextEntry = true
        passwordTextFied.delegate = self
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .systemGray2
        
        layer .cornerRadius = 5
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(usernameTextFied)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextFied)
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
            //dividerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier:1)

        ])
    }
    
}
