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
    
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textField.tag = 1
        textField2.delegate = self
        textField2.tag = 2
        //textField의 대행자(delegate)를 뷰컨트롤러로 설정
        
        setUp()
    }
    
    func setUp(){
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "max 10"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder()
        
        textField2.keyboardType = UIKeyboardType.numberPad
        textField2.placeholder = "max 20"
        textField2.borderStyle = .roundedRect
        textField2.clearButtonMode = .always
        textField2.returnKeyType = .done
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
        textField2.becomeFirstResponder()
    }

    // 한글자씩 타이핑이 될때마다 감지하는 메서드
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.tag)
        if textField.tag == 1 {
            return range.location < 10
        } else if textField.tag == 2 {
            return range.location < 20
        } else {
            return false
        }
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.text == "" {
            textField.placeholder = "Type Sometheing"
            return false
        } else {
            return true
        }
    }
    
    //화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

