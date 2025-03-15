import Foundation
import UIKit

class LoginView: UIView {
    
    let usernameTextFiled = UITextField()
    let passwordTextFiled = UITextField()
    let dividerLine = UIView()
    
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

extension LoginView {
    
    func style() {
       
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        usernameTextFiled.translatesAutoresizingMaskIntoConstraints = false
        usernameTextFiled.placeholder = "Username"
        
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.backgroundColor = .systemGray
    
        passwordTextFiled.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFiled.placeholder = "Password"
        passwordTextFiled.isSecureTextEntry = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .secondarySystemBackground
        
        layer.cornerRadius = 8
    }
    
    func layout() {
        
        stackView.addArrangedSubview(usernameTextFiled)
        stackView.addArrangedSubview(dividerLine)
        stackView.addArrangedSubview(passwordTextFiled)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            dividerLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        
    }
}
//
//  Untitled.swift
//  project18
//
//  Created by Laszlo Kovacs on 2025. 03. 12..
//

