//
//  ViewController.swift
//  MicroFocusInterviewTask
//
//  Created by Pavithra on 15/02/22.
//

import UIKit

class MFLoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUiElement()
    }
    func setUpUiElement(){
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    @IBAction func loginButtonAction(_ sender: UIButton) {
        var errorMessage:String = ""
        if usernameTextField.text == nil || usernameTextField.text!.count <= 0 {
            errorMessage = "Enter user name"
            handleErrorAlert(message:errorMessage, textfield:usernameTextField)
        }else if passwordTextField.text == nil || passwordTextField.text!.count <= 0 {
            errorMessage = "Enter user Password"
            handleErrorAlert(message:errorMessage, textfield:passwordTextField)
        }else{
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "MFFormViewController") as! MFFormViewController
            secondViewController.modalPresentationStyle = .fullScreen
            self.present(secondViewController, animated: true, completion: nil)
        }
    }
    func handleErrorAlert(message:String, textfield:UITextField)  {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            textfield.becomeFirstResponder()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


extension MFLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        usernameTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

