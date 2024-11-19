//
//  CheckinViewController.swift
//  Routine3
//
//  Created by user@95 on 16/11/24.
//

import UIKit

class CheckinViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var RoutineCollectionView: UICollectionView!
   
    let routineTypes = ["Morning Routine", "Night Routine", "Morning Log", "Night Log"]

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section)
        
            switch routineTypes[indexPath.row] {
            case "Morning Routine":
                if let morningRoutineVC = storyboard?.instantiateViewController(withIdentifier: "MorningRoutineViewController") {
                    navigationController?.pushViewController(morningRoutineVC, animated: true)
                }
            case "Night Routine":
                if let nightRoutineVC = storyboard?.instantiateViewController(withIdentifier: "NightRoutineViewController") {
                    navigationController?.pushViewController(nightRoutineVC, animated: true)
                }
            case "Morning Log":
                if let morningLogVC = storyboard?.instantiateViewController(withIdentifier: "MorningLogViewController") {
                    navigationController?.pushViewController(morningLogVC, animated: true)
                }
            case "Night Log":
                if let nightLogVC = storyboard?.instantiateViewController(withIdentifier: "NightLogViewController") {
                    navigationController?.pushViewController(nightLogVC, animated: true)
                }
            default:
                break
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the custom cell with the collection view if needed
        RoutineCollectionView.dataSource = self
        RoutineCollectionView.delegate = self
        RoutineCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return routine.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue the custom cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoutineCollectionViewCell", for: indexPath) as! RoutineCollectionViewCell
        
        // Configure the cell using the setup method
        let routineItem = routine[indexPath.item]
        cell.setup(with: routineItem)
        
        return cell
    }

}

extension ViewController : UICollectionViewDelegateFlowLayout{
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
return CGSize(width: 150, height: 220)
}
}
extension CheckinViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Set the vertical spacing between rows
        return 40 // mm equivalent in points
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Add insets for section padding
        return UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    }
}
