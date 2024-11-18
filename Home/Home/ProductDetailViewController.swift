//
//  ProductDetailViewController.swift
//  Home
//
//  Created by admin12 on 18/11/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productTypeLabel: UILabel!
    @IBOutlet weak var shopNowButton: UIButton!
    @IBOutlet weak var ingredientListButton: UIButton!
    @IBOutlet weak var ingredientsCircleView: UIView!
    @IBOutlet weak var benefitsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var starRatingView: UIView!
    @IBOutlet weak var reviewsBasedOnLabel: UILabel!
    
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let product = product {
            updateUI(with: product)
        }
    }
    func updateUI(with product: Product) {
        productImageView.image = UIImage(named: product.imageName)
        productTitleLabel.text = product.name
        productTypeLabel.text = product.type
        
        benefitsLabel.text = product.benefits
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
