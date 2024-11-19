//
//  LoginViewController.swift
//  SignUp
//
//  Created by admin2 on 18/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupJoinWithSeparator()
    }
    
    private func setupJoinWithSeparator() {
        
        let separatorContainer = UIView()
        separatorContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorContainer)
        
        // Create the left line
        let leftLine = UIView()
        leftLine.backgroundColor = UIColor.lightGray
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        separatorContainer.addSubview(leftLine)
        
        // Create the label
        let label = UILabel()
        label.text = "or Join with"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        separatorContainer.addSubview(label)
       
        // Create the right line
        let rightLine = UIView()
        rightLine.backgroundColor = UIColor.lightGray
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        separatorContainer.addSubview(rightLine)
        
        // Add constraints for the container view
        NSLayoutConstraint.activate([
            separatorContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            separatorContainer.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 85),
            separatorContainer.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor),
            separatorContainer.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Add constraints for the left line
        NSLayoutConstraint.activate([
            leftLine.leadingAnchor.constraint(equalTo: separatorContainer.leadingAnchor),
            leftLine.centerYAnchor.constraint(equalTo: separatorContainer.centerYAnchor),
            leftLine.heightAnchor.constraint(equalToConstant: 1),
            leftLine.widthAnchor.constraint(equalTo: separatorContainer.widthAnchor, multiplier: 0.4)
        ])
        
        // Add constraints for the label
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: separatorContainer.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: separatorContainer.centerYAnchor)
        ])
        
        // Add constraints for the right line
        NSLayoutConstraint.activate([
            rightLine.trailingAnchor.constraint(equalTo: separatorContainer.trailingAnchor),
            rightLine.centerYAnchor.constraint(equalTo: separatorContainer.centerYAnchor),
            rightLine.heightAnchor.constraint(equalToConstant: 1),
            rightLine.widthAnchor.constraint(equalTo: separatorContainer.widthAnchor, multiplier: 0.4)
        ])
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if validateFields() {
                    // Perform login logic
                    performSegue(withIdentifier: "showMainApp", sender: self)
                }
    }
    func validateFields() -> Bool {
            guard let email = emailTextField.text, !email.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty else {
                showAlert(message: "Please fill in all fields.")
                return false
            }
            return true
        }

        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
