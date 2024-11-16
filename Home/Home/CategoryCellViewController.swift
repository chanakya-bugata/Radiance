//
//  CategoryCellViewController.swift
//  Home
//
//  Created by admin12 on 14/11/24.
//

import UIKit

class CategoryCellViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var cleanCollectionView: UICollectionView!
    
    var categoryTitle: String? // This will hold the category title passed from the previous screen.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the navigation bar title
        if let title = categoryTitle {
            self.title = title
        }
        
        // Set up the collection view
        collectionView.dataSource = self
        cleanCollectionView.dataSource = self
        collectionView.delegate = self
        cleanCollectionView.delegate = self

    }

}
extension CategoryCellViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cleanCollectionView {
            return cleanProducts.count
        } else {
            return recommendedProducts.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cleanCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CleanProductCell", for: indexPath) as! CleanProductCell
            cell.configure(with: cleanProducts[indexPath.item])
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.configure(with: recommendedProducts[indexPath.item])
        return cell
    }
}
