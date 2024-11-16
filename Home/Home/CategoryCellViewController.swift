//
//  CategoryCellViewController.swift
//  Home
//
//  Created by admin12 on 14/11/24.
//

import UIKit

class CategoryCellViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var categoryTitle: String? // This will hold the category title passed from the previous screen.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the navigation bar title
        if let title = categoryTitle {
            self.title = title
        }
        
        // Set up the collection view
        collectionView.dataSource = self
        collectionView.delegate = self

    }

}
extension CategoryCellViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedProducts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.configure(with: recommendedProducts[indexPath.item])
        return cell
    }
}
