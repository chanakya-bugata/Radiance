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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {
            // Set it as the root view controller
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = tabBarController
                window.makeKeyAndVisible()
            }
        }
    }
    
    @IBAction func existingAccountTapped(_ sender: UIButton) {
    }
    
}
