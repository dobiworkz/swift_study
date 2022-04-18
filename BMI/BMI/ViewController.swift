//
//  ViewController.swift
//  BMI
//
//  Created by Ho bin Lee on 2022/04/18.
//

import UIKit

class ViewController: UIViewController  {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        makeUI()
    }
    
    func makeUI(){
        mainLabel.text = "키와 몸무게를 입력해주세요"
        
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder="cm단위로 입력"
        weightTextField.placeholder="kg단위로 입력"
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }

    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text="키와 몸무게를 반드시 입력해야 합니다."
            mainLabel.textColor = .red
            return false
        }
        
        mainLabel.text="키와 몸무게를 입력해주세요"
        mainLabel.textColor = .black
        
        return true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let resultView = segue.destination as! ResultViewController
            
            resultView.height = heightTextField.text
            resultView.weight = weightTextField.text
        }
        
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 숫자만 입력되도록, ""를 허용하는 이유는 글자 삭제시 true를 리턴하기 위함
        if Int(string) != nil || string == "" {
            return true
        }
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        
        return false
    }
    
    
}
