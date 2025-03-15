//
//  Untitled.swift
//  project2025-3
//
//  Created by Laszlo Kovacs on 2025. 02. 28..
//
//
//  OnboardingViewConainer.swift
//  Project2025-2
//
//  Created by Laszlo Kovacs on 2025. 02. 28..
//
import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let imageView = UIImageView()
    let closedButton = UIButton()
    
    var heroImageName: String!
    var titleText: String!
    
    init(heroImageName: String!, titleText: String!) {
        self.heroImageName = heroImageName
        self.titleText = titleText
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
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: heroImageName)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = titleText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(imageView)
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


