//
//  LoginView.swift
//  project19
//
//  Created by Laszlo Kovacs on 2025. 03. 12..
//

import Foundation
import UIKit

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("Init (coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}

extension LoginView {
    
    func style() {
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        
    }
}
