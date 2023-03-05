//
//  ViewController.swift
//  2nd
//
//  Created by Maxim Soloboev on 04.03.2023.
//

import UIKit


class ViewController: UIViewController {

    private lazy var firstButton = createButton(title: "First Button")
    private lazy var secondButton = createButton(title: "Second Medium Button")
    private lazy var thirdButton = createButton(title: "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        setupAction()
    }
    
    private func setupHierarchy() {
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
    }
    
    private func setupLayout() {
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func createButton(title: String) -> UIButton {
        let button = UIButton(type: .custom)
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .medium
        configuration.title = title
        configuration.titleAlignment = .center
        configuration.attributedTitle?.font = UIFont.systemFont(ofSize: 18)
        configuration.imagePadding = 8
        configuration.image = UIImage(systemName: "arrow.forward.circle.fill")
        configuration.imagePlacement = .trailing
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                              leading: 14,
                                                              bottom: 10,
                                                              trailing: 14)
        button.configuration = configuration
        button.startAnimatingPressActions()
        return button
    }
    
    private func setupAction() {
        thirdButton.addTarget(self, action: #selector(switchToModal), for: .touchUpInside)
    }
    
    @objc private func switchToModal() {
        let viewController = ViewControllerTwo()
        present(viewController, animated: true)
    }
}

