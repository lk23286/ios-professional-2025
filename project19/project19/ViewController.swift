//
//  ViewController.swift
//  project19
//
//  Created by Laszlo Kovacs on 2025. 03. 12..
//

import UIKit

class ViewController: UIViewController {
    
    let loginView = LoginView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
        
        
    }
    
}

extension ViewController {
    private func style() {
        
    }
    
    private func layout() {
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            ])
    }
}

