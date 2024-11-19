//
//  NightRoutineViewController.swift
//  Routine3
//
//  Created by user@95 on 16/11/24.
//

import UIKit

class NightRoutineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tbllist2: UITableView!
    var nightlog: [NightLog] = [
           NightLog(producttype: "1. Cleanser", productsimage: UIImage(named: "cetaphil"), productdescription: "Cetaphil Gentle Skin Cleanser", time: "9:00 PM", MrnglogChecklist: false),
           NightLog(producttype: "2. Toner", productsimage: UIImage(named: "minimalist"), productdescription: "Minimalist Glycolic Acid", time: "9:05 PM", MrnglogChecklist: false),
           NightLog(producttype: "3. Moisturiser", productsimage: UIImage(named: "ponds"), productdescription: "Pond’s Light Moisturiser", time: "9:10 PM", MrnglogChecklist: false),
           NightLog(producttype: "4. Sunscreen", productsimage: UIImage(named: "pondssunscreen"), productdescription: "Pond’s Serum Boost Sunscreen", time: "9:13 PM", MrnglogChecklist: false)
       ]
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1.0) // Equivalent to #F6F6F6
           
           tbllist2.delegate = self
           tbllist2.dataSource = self
           tbllist2.register(UINib(nibName: "NightRoutineTableViewCell", bundle: nil), forCellReuseIdentifier: "NightRoutineCell")
       }
       
       // MARK: - TableView DataSource and Delegate Methods
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return nightlog.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "NightRoutineCell", for: indexPath) as? NightRoutineTableViewCell else {
               return UITableViewCell()
           }
           
           let log = nightlog[indexPath.row]
           cell.producttype2.text = log.producttype
           cell.productdetails2.text = log.productdescription
           cell.productimage2.image = log.productsimage
           cell.time2.text = log.time
           
           // Configure checkmark button
           let imageName = log.MrnglogChecklist ? "checkmark" : "unchecked"
           cell.checkbox2.setImage(UIImage(named: imageName), for: .normal)
           
           // Handle button tap
           cell.checkbox2.tag = indexPath.row
           cell.checkbox2.addTarget(self, action: #selector(checkmarkTapped(_:)), for: .touchUpInside)
           
           return cell
       }
       
       @objc func checkmarkTapped(_ sender: UIButton) {
           let index = sender.tag
           nightlog[index].MrnglogChecklist.toggle()
           tbllist2.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
       }
   }
