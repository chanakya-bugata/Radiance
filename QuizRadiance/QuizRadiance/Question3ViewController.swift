//
//  Question3ViewController.swift
//  QuizRadiance
//
//  Created by admin2 on 18/11/24.
//

import UIKit

class Question3ViewController: UIViewController {
       
        let skinTypes = ["Normal", "Dry", "Oily", "Sensitive", "Combination"]

        let customPink = UIColor(red: 0.93, green: 0.52, blue: 0.58, alpha: 1.0)

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .white

            let headingLabel = UILabel()
            let verticalStackView = UIStackView()
            verticalStackView.axis = .vertical
            verticalStackView.alignment = .fill
            verticalStackView.distribution = .fillEqually
            verticalStackView.spacing = 20 
            verticalStackView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(verticalStackView)
            
            NSLayoutConstraint.activate([
                verticalStackView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 215),
                verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ])

            for skinType in skinTypes {
                // Create a button for each skin type
                let button = UIButton(type: .system)
                button.setTitle(skinType, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.layer.borderWidth = 1.5
                button.layer.borderColor = customPink.cgColor
                button.layer.cornerRadius = 15
                button.backgroundColor = .white
                button.titleLabel?.font = UIFont.systemFont(ofSize: 17)

                button.addTarget(self, action: #selector(skinTypeButtonTapped(_:)), for: .touchUpInside)
 
                button.heightAnchor.constraint(equalToConstant: 50).isActive = true

                verticalStackView.addArrangedSubview(button)
            }
        }

        @objc func skinTypeButtonTapped(_ sender: UIButton) {
            if sender.backgroundColor == customPink {
                sender.backgroundColor = .white
                sender.setTitleColor(.black, for: .normal)
            } else {
                sender.backgroundColor = customPink
                sender.setTitleColor(.white, for: .normal)
            }
        }
    }
