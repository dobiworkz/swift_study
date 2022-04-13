//
//  ViewController.swift
//  SlideTimer
//
//  Created by Ho bin Lee on 2022/04/13.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var sliderButton: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTimer()
    }


    @IBAction func resetButtonTapped(_ sender: UIButton) {
        initTimer()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func sliderMove(_ sender: UISlider) {
        
        let sliderValue:Int = Int(sender.value * 60)
        //sender.value => 0...1
        
        countLabel.text = "\(sliderValue)초"
        
    }
    
    func initTimer(){
        // 1. 라벨 초기화
        countLabel.text = "초를 선택하세요"
        
        // 2. 슬라이더 버튼 초기화
        sliderButton.setValue(0.5, animated: true)
        
    }
    
}

