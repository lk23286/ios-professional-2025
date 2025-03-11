//
//  OnboardingViewController.swift
//  project2025-6
//
//  Created by Laszlo Kovacs on 2025. 03. 09..
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let imageLabel = UIImageView()
    
    let heroImageName: String
    let textName: String
    
    weak var delegate: OnboardingContainerViewControllerDelegate?
    
    
   init(heroImageName: String, textName: String) {
        self.heroImageName = heroImageName
        self.textName = textName
       
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
        label.text = textName
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.image = UIImage(named: heroImageName)
        imageLabel.contentMode = .scaleAspectFit
        
    }
    
    func layout() {
        stackView.addArrangedSubview(imageLabel)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}

extension OnboardingViewController {
    @objc func closeTapped() {
        print("Close tapped")
        delegate?.didOnboardingFinish()
    }
}
