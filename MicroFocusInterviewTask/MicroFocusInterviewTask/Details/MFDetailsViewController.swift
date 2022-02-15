//
//  MFDetailsViewController.swift
//  MicroFocusInterviewTask
//
//  Created by Pavithra on 15/02/22.
//

import UIKit
import Foundation

class MFDetailsViewController: UIViewController {
    var empList: [detailsList] = []
    let cellReuseIdentifier = "CustomTableViewCell"
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUiElement()
    }
    func setUpUiElement(){
            tableview.delegate = self
            tableview.dataSource = self
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 44
        let customCell = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        tableview.register(customCell, forCellReuseIdentifier: "CustomTableViewCell")
    }
    @IBAction func closeButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension MFDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return empList.count
        }
        
        // create a cell for each table view row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // create a new cell if needed or reuse an old one
            let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CustomTableViewCell
            
            // set the text from the data model
            let empName = empList[indexPath.row]
            cell.labName.text = empName.name
            cell.labMessage.text = empName.message
            cell.labAge.text = "\(empName.age)"
            cell.contentView.backgroundColor = UIColor.lightText
            return cell
        }
        
        // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
            
        }
    

}

