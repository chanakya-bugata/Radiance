//
//  SignUpViewController.swift
//  SignUp
//
//  Created by admin2 on 18/11/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupJoinWithSeparator()
        
        //        passwordTextField.isSecureTextEntry = true
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
        label.text = " or Join with "
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
            separatorContainer.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
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
    

    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(message: "Email is required.")
            return
        }
        guard let username = usernameTextField.text, !username.isEmpty else {
            showAlert(message: "Username is required.")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Password is required.")
            return
        }
        
        // Check for duplicate email or username separately
        if checkIfEmailExists(email) {
            showAlert(message: "Email already exists. Please choose a different one.")
            return
        }
        
        if checkIfUsernameExists(username) {
            showAlert(message: "Username already exists. Please choose a different one.")
            return
        }
        
        // Save data to the shared User model
        User.shared.username = username
        User.shared.email = email
        User.shared.password = password
        
//        // Save user data to CSV
//        CSVManager.shared.saveUserData()
        
        // Navigate to the next screen
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "Question1ViewController") as? Question1ViewController {
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
            
    private func checkIfEmailExists(_ email: String) -> Bool {
        // This can be a simple check, or you can load users from the CSV and check against them
        let existingUsers = CSVManager.shared.readAllUsers()
        return existingUsers.contains { $0["Email"] == email }
    }
        
    private func checkIfUsernameExists(_ username: String) -> Bool {
        // This can be a simple check, or you can load users from the CSV and check against them
        let existingUsers = CSVManager.shared.readAllUsers()
        return existingUsers.contains { $0["Username"] == username }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Invalid Input", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
