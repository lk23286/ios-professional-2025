//
//  ViewController.swift
//  project 12
//
//  Created by Laszlo Kovacs on 2025. 02. 22..
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
    
    func style() {
        view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            //loginView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 1)
            

        ])
    }
}
