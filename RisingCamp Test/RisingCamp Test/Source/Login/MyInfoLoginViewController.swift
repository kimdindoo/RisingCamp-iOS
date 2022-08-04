//
//  MyInfoLoginViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/21.
//

import UIKit

class MyInfoLoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var enterCodeLabel: UILabel!
    //    lazy var dataManager: selfAuthManager = selfAuthManager()
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isEnabled = false
        
   }


    @IBAction func sendMesseageButtonTapped(_ sender: Any) {
        selfAuthManager.shared.postMessageAuth(name: self.nameTextField.text!, phoneNum: self.phoneNumTextField.text!)

    }
    
    @IBAction func testcomfirmButtonTapped(_ sender: Any) {
        selfAuthManager.shared.getMessageAuth(vc: self, code: self.codeTextField.text!, phoneNum: self.phoneNumTextField.text!)
        
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        selfAuthManager.shared.postLogin(name: self.nameTextField.text!, phoneNum: self.phoneNumTextField.text!, vc: self)
        
    }
    
    
    func didSuccess(result: messageConfirmResponse) {
        enterCodeLabel.text = result.message
        if result.code == 1000 {
            loginButton.isEnabled = true
        }
    }
    
    func didSuccess2(_ result: loginResponse) {
        
    }
    

    
    
}



