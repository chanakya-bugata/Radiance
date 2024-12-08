//
//  OnBoardingViewController.swift
//  Home
//
//  Created by admin12 on 18/11/24.
//

import UIKit

class OnBoardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let sheetVC = storyboard.instantiateViewController(withIdentifier: "SheetViewController") as? SheetViewController {
            sheetVC.modalPresentationStyle = .pageSheet
            if let sheet = sheetVC.sheetPresentationController {
                sheet.detents = [.custom { context in
                    return context.maximumDetentValue * 0.25 // Adjust height proportion (0.4 for less than half)
                }] // This sets the height to a "medium" size (half the screen)
                sheet.prefersGrabberVisible = true // Optional: adds a grabber to drag the sheet
            }
            present(sheetVC, animated: true, completion: nil)
        }
    }

}
