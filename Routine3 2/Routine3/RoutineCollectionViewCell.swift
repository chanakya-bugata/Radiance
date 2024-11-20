//
//  RoutineCollectionViewCell.swift
//  Routine3
//
//  Created by user@95 on 16/11/24.
//

import UIKit

class RoutineCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var RoutineTitle: UILabel!
    
    @IBOutlet weak var RoutineimageView: UIImageView!
    
    @IBOutlet weak var RoutineSubtitle: UILabel!
    @IBOutlet weak var RoutineCheckbox: UIButton!
    
    @IBOutlet weak var roundedBackgroundView: UIView!
    
    func setup(with routine: Routine) {
          // Set image, title, subtitle, and checkbox state
          RoutineimageView.image = routine.image
          RoutineTitle.text = routine.title
          RoutineSubtitle.text = routine.subtitle
          RoutineCheckbox.isSelected = routine.iscompleted
          
          if RoutineCheckbox.isSelected {
              RoutineCheckbox.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
          } else {
              RoutineCheckbox.setImage(UIImage(systemName: "circle"), for: .normal)
          }
          
          RoutineCheckbox.tintColor = .white
          
          // Apply rounded top corners to the image view
          roundTopCorners(view: RoutineimageView, radius: 20)
          
          // Configure rounded bottom corners for the background view
          roundedBackgroundView.backgroundColor = .white // Ensure it's set to white
          roundBottomCorners(view: roundedBackgroundView, radius: 20)
      }
      
      private func roundTopCorners(view: UIView, radius: CGFloat) {
          DispatchQueue.main.async { // Ensures layout is updated
              let path = UIBezierPath(roundedRect: view.bounds,
                                      byRoundingCorners: [.topLeft, .topRight],
                                      cornerRadii: CGSize(width: radius, height: radius))
              let mask = CAShapeLayer()
              mask.path = path.cgPath
              view.layer.mask = mask
              view.clipsToBounds = true // Ensures content stays within rounded corners
          }
      }
      
      private func roundBottomCorners(view: UIView, radius: CGFloat) {
          DispatchQueue.main.async { // Ensures layout is updated
              let path = UIBezierPath(roundedRect: view.bounds,
                                      byRoundingCorners: [.bottomLeft, .bottomRight],
                                      cornerRadii: CGSize(width: radius, height: radius))
              let mask = CAShapeLayer()
              mask.path = path.cgPath
              view.layer.mask = mask
              view.clipsToBounds = true // Ensures content stays within rounded corners
          }
      }
      
      override func layoutSubviews() {
          super.layoutSubviews()
          // Ensure the rounded corners are applied after layout
          roundTopCorners(view: RoutineimageView, radius: 20)
          roundBottomCorners(view: roundedBackgroundView, radius: 20)
      }
  }
