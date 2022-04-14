//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Ho bin Lee on 2022/04/14.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    func setUp(){
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
}

