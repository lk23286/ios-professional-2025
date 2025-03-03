//
//  OnboardingViewController.swift
//  project2025-5
//
//  Created by Laszlo Kovacs on 2025. 03. 02..
//
import Foundation
import UIKit

class OnboardingViewContainer: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
    
}

extension OnboardingViewContainer {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, World!"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}


