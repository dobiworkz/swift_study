//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Ho bin Lee on 2022/04/14.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//UITextFieldDelegate protocol inherit
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        //textField의 대행자(delegate)를 뷰컨트롤러로 설정
        
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
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.text == "" {
            textField.placeholder = "Type Sometheing"
            return false
        } else {
            return true
        }
    }
    
}

