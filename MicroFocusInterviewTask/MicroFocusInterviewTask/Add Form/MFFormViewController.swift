//
//  MFFormViewController.swift
//  MicroFocusInterviewTask
//
//  Created by Pavithra on 15/02/22.
//

import UIKit
import Foundation

struct detailsList: Codable {
    var name: String
    var age : Int
    var message: String
}
class MFFormViewController: UIViewController {
    var empList: [detailsList] = []
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var tableview: UITableView!
    let userName: [String] = ["Ananya", "Diya", "Diya S","Pavithra"]
    let cellReuseIdentifier = "CustomTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUiElement()
    }
    func setUpUiElement(){
        usernameTextField.delegate = self
        ageTextField.delegate = self
        tableview.isHidden = true
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    @IBAction func submitButtonAction(_ sender: UIButton) {
        empList.append(detailsList(name: usernameTextField.text ?? "", age: Int(ageTextField.text!) ?? 0, message: message.text ?? ""))
        usernameTextField.text = nil
        ageTextField.text =  nil
        message.text = nil
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "MFDetailsViewController") as! MFDetailsViewController
        detailVC.empList = empList
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true, completion: nil)
    }
}
extension MFFormViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if usernameTextField == textField {
            tableview.isHidden = true
           
        }else {
        ageTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if usernameTextField == textField {
            tableview.isHidden = false
            usernameTextField.inputView = UIView()
        }
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if usernameTextField == textField {
            tableview.isHidden = false
            return false
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tableview.isHidden = true
        self.view.endEditing(true)
    }
}
extension MFFormViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.userName.count
        }
        
        // create a cell for each table view row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // create a new cell if needed or reuse an old one
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
            
            // set the text from the data model
            cell.textLabel?.text = self.userName[indexPath.row]
            cell.contentView.backgroundColor = UIColor.lightText
            return cell
        }
        
        // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
            usernameTextField.text = "\(self.userName[indexPath.row])"
            tableview.isHidden = true
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
