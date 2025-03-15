//
//  DummyViewController.swift
//  project2025-3
//
//  Created by Laszlo Kovacs on 2025. 03. 08..
//

import Foundation
import UIKit


class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let signoutButton = UIButton(type: .system)
    
    weak var delegate: LogoutDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
    
}

extension DummyViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome!"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        signoutButton.translatesAutoresizingMaskIntoConstraints = false
        signoutButton.configuration = .filled()
        signoutButton.setTitle("Sign Out", for: .normal)
        signoutButton.addTarget(self, action: #selector(signOutTouched), for: .primaryActionTriggered)
        
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(signoutButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}
extension DummyViewController: ObservableObject {
    @objc func signOutTouched() {
        print("Signout touched")
        delegate?.didLogout()
    }
}
