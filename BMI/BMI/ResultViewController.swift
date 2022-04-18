//
//  ResultViewController.swift
//  BMI
//
//  Created by Ho bin Lee on 2022/04/18.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    var height: String?
    var weight: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    
    func makeUI(){
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        backButton.setTitle("다시하기", for: .normal)
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        
        calculate()
    }
    
    func calculate(){
        guard let w = Double(weight!), let h = Double(height!) else{ return }
        
        var bmi = w / ( h * h ) * 10000
        bmi = round(bmi * 10) / 10
        
        bmiNumberLabel.text = String(bmi)
        switch bmi{
        case ..<18.5 :
            adviceLabel.text = "저체중"
            bmiNumberLabel.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        case 18.6..<22.9 :
            adviceLabel.text = "표준체중"
            bmiNumberLabel.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        case 23.0..<24.9 :
            adviceLabel.text = "과체중"
            bmiNumberLabel.backgroundColor = #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)
        case 25.0..<29.9 :
            adviceLabel.text = "중도비만"
            bmiNumberLabel.backgroundColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        case 30.0... :
            adviceLabel.text = "고도비만"
            bmiNumberLabel.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        default :
            break
        }
        
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
