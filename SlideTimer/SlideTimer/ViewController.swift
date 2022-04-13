//
//  ViewController.swift
//  SlideTimer
//
//  Created by Ho bin Lee on 2022/04/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var sliderButton: UISlider!
    
    var timerCount:Int = 30
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTimer()
    }


    @IBAction func resetButtonTapped(_ sender: UIButton) {
        initTimer()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ [self] _ in
              countTime()
            }
    }
    
    @IBAction func sliderMove(_ sender: UISlider) {
        
        timerCount = Int(sender.value * 60)
        //sender.value => 0...1
        
        countLabel.text = "\(timerCount)초"
        
    }
    
    func initTimer(){
        // 1. 라벨 초기화
        countLabel.text = "초를 선택하세요"
        
        // 2. 슬라이더 버튼 초기화
        sliderButton.setValue(0.5, animated: true)
        
        timerCount = 30
        
        timer?.invalidate()
        
    }
    
    func countTime(){
        if timerCount > 0{
            timerCount -= 1
            sliderButton.setValue(Float(timerCount)/Float(60), animated: true)
            countLabel.text = "\(timerCount)초"
            
        } else {
            AudioServicesPlaySystemSound(SystemSoundID(1016))
            timer?.invalidate()
        }
        
    }
    
}

