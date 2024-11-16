//
//  CleanProductCell.swift
//  Home
//
//  Created by admin12 on 16/11/24.
//

import UIKit

class CleanProductCell: UICollectionViewCell {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productTypeLabel: UILabel!
    
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    func configure(with product: Product) {
        productImageView.image = UIImage(named: product.imageName)
        productNameLabel.text = product.name
        productTypeLabel.text = product.type
        costLabel.text = product.cost
        ratingLabel.text = "⭐️ \(product.rating)"
        
        productImageView.layer.cornerRadius = 12
        productImageView.clipsToBounds = true
        
    }
}
