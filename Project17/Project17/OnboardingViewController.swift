//
//  Untitled.swift
//  Project17
//
//  Created by Laszlo Kovacs on 2025. 03. 01..
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let ImageView = UIImageView()
    let heroImageName: String
    let textLabel: String
    
    init(heroImageName: String, textLabel: String) {
        self.heroImageName = heroImageName
        self.textLabel = textLabel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
    }
    
}

extension OnboardingViewController {
    
    func style() {
        
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = textLabel
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.textAlignment = .center
       
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.image = UIImage(named: heroImageName)
        ImageView.contentMode = .scaleAspectFit
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(ImageView)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
    }
}

