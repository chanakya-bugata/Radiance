//
//  MorningRoutineViewController.swift
//  Routine3
//
//  Created by user@95 on 16/11/24.
//

import UIKit

class MorningRoutineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblList: UITableView!
  

        var morninglog: [MorningLog] = [
            MorningLog(producttype: "1. Cleanser", productsimage: UIImage(named: "cetaphil"), productdescription: "Cetaphil Gentle Skin Cleanser", time: "8:00 AM", MrnglogChecklist: false),
            MorningLog(producttype: "2. Toner", productsimage: UIImage(named: "minimalist"), productdescription: "Minimalist Glycolic Acid", time: "8:05 AM", MrnglogChecklist: false),
            MorningLog(producttype: "3. Moisturiser", productsimage: UIImage(named: "ponds"), productdescription: "Pond’s Light Moisturiser", time: "8:10 AM", MrnglogChecklist: false),
            MorningLog(producttype: "4. Sunscreen", productsimage: UIImage(named: "pondssunscreen"), productdescription: "Pond’s Serum Boost Sunscreen", time: "8:13 AM", MrnglogChecklist: false)
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1.0) // Equivalent to #F6F6F6

            
            tblList.delegate = self
            tblList.dataSource = self
            tblList.register(UINib(nibName: "MorningRoutineTableViewCell", bundle: nil), forCellReuseIdentifier: "MorningRoutineCell")
        }
        
        // MARK: - TableView DataSource and Delegate Methods
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return morninglog.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MorningRoutineCell", for: indexPath) as? MorningRoutineTableViewCell else {
                return UITableViewCell()
            }
            
            let log = morninglog[indexPath.row]
            cell.producttype.text = log.producttype
            cell.productdetail.text = log.productdescription
            cell.productimage.image = log.productsimage
            cell.time.text = log.time
            
            // Configure checkmark button
            let imageName = log.MrnglogChecklist ? "checkmark" : "unchecked"
            cell.btnCheckmark.setImage(UIImage(named: imageName), for: .normal)
            
            // Handle button tap
            cell.btnCheckmark.tag = indexPath.row
            cell.btnCheckmark.addTarget(self, action: #selector(checkmarkTapped(_:)), for: .touchUpInside)
            
            return cell
        }
        
        @objc func checkmarkTapped(_ sender: UIButton) {
            let index = sender.tag
            morninglog[index].MrnglogChecklist.toggle()
            tblList.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
        }
    }

