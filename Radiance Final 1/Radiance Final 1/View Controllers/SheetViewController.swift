//
//  SheetViewController.swift
//  Home
//
//  Created by admin12 on 18/11/24.
//

import UIKit

class SheetViewController: UIViewController {
    
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var existingAccountButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func getStartedTapped(_ sender: UIButton) {
        // Navigate to SignUpNavigationController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let signUpNavController = storyboard.instantiateViewController(withIdentifier: "SignUpNavigationController") as? UINavigationController {
            // Set it as the root view controller
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = signUpNavController
                window.makeKeyAndVisible()
            }
        }
    }

    
    @IBAction func existingAccountTapped(_ sender: UIButton) {
        // Navigate to LoginViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            // Set it as the root view controller
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = loginViewController
                window.makeKeyAndVisible()
            }
        }
    }
}
