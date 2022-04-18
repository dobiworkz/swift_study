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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func makeUI(){
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        backButton.setTitle("다시하기", for: .normal)
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
