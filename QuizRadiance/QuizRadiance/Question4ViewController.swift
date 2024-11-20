//
//  Question4ViewController.swift
//  QuizRadiance
//
//  Created by admin2 on 18/11/24.
//

import UIKit

class Question4ViewController: UIViewController {

    let skinGoal = ["Hydration", "Acne Free", "Anti-Aging", "Sun Protection", "Even Skin Tone", "Face Glow"]
    
    // Define custom pink color
    let customPink = UIColor(red: 0.93, green: 0.52, blue: 0.58, alpha: 1.0) // Customize this color as needed

        override func viewDidLoad() {
            super.viewDidLoad()

            let headingLabel = UILabel()

            let verticalStackView = UIStackView()
            verticalStackView.axis = .vertical
            verticalStackView.alignment = .fill
            verticalStackView.distribution = .fillEqually
            verticalStackView.spacing = 15
            verticalStackView.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(verticalStackView)
            
            NSLayoutConstraint.activate([
                headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                headingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])
            
            NSLayoutConstraint.activate([
                verticalStackView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 215),
                verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])
            
            let buttonsPerRow = 2
            var currentHorizontalStackView: UIStackView?

            for (index, concern) in skinGoal.enumerated() {
                
                if index % buttonsPerRow == 0 {
                    currentHorizontalStackView = UIStackView()
                    currentHorizontalStackView?.axis = .horizontal
                    currentHorizontalStackView?.alignment = .fill
                    currentHorizontalStackView?.distribution = .fillEqually
                    currentHorizontalStackView?.spacing = 10
                    
                    if let horizontalStack = currentHorizontalStackView {
                        verticalStackView.addArrangedSubview(horizontalStack)
                    }
                }
                
                
                let button = UIButton(type: .system)
                button.setTitle(concern, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.layer.borderWidth = 1.5
                button.layer.borderColor = customPink.cgColor
                button.layer.cornerRadius = 15
                button.backgroundColor = .white
                button.titleLabel?.font = UIFont.systemFont(ofSize: 17)

                button.heightAnchor.constraint(equalToConstant: 60).isActive = true 

                button.addTarget(self, action: #selector(concernButtonTapped(_:)), for: .touchUpInside)

                currentHorizontalStackView?.addArrangedSubview(button)
            }
        }

        @objc func concernButtonTapped(_ sender: UIButton) {
            if sender.backgroundColor == customPink {
                sender.backgroundColor = .white
                sender.setTitleColor(.black, for: .normal)
            } else {
                sender.backgroundColor = customPink
                sender.setTitleColor(.white, for: .normal)
            }
        }
    }

