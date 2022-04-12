//
//  ViewController.swift
//  RPSGame
//
//  Created by Ho bin Lee on 2022/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var userChoiceLabel: UILabel!
    
    var userPick:Rps?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initGame()
    }

    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 1.가위/바위/보 선택시 플레이어 이미지 변경
        // 2.플레이어의 선택 정보 저장
        guard let title =  sender.currentTitle else { return }
        
        switch title{
        case "가위" :
            userImageView.image = #imageLiteral(resourceName: "scissors")
            userPick = Rps.scissors
            userChoiceLabel.text = "가위"
        case "바위" :
            userImageView.image = #imageLiteral(resourceName: "rock")
            userPick = Rps.rock
            userChoiceLabel.text = "바위"
        case "보" :
            userImageView.image = #imageLiteral(resourceName: "paper")
            userPick = Rps.paper
            userChoiceLabel.text = "보"
        default :
            break
        }
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 0.사용자가 선택하지 않고 select 버튼을 누른 경우 return
        guard let userChoice = userPick else { return }
        
        // 1.컴퓨터의 랜덤선택
        let comChoice = Rps.init(rawValue: Int.random(in: 0...2))!
        // 2.컴퓨터 선택 이미지 출력
        // 3.컴퓨터 선택 레이블 출력
        switch comChoice{
        case Rps.scissors :
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        case Rps.rock :
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper :
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        }
        
        // 4.컴퓨터 플레이어 선택비교
        // 5.승패여부 출력
        
        if comChoice == userPick{
            mainLabel.text = "비겼습니다."
        } else if (comChoice == .rock && userChoice == .paper) || (comChoice == .scissors && userChoice == .rock) || (comChoice == .paper && userChoice == .scissors) {
            mainLabel.text = "이겼습니다."
        } else {
            mainLabel.text = "졌습니다."
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        initGame()
    }
    
    func initGame(){
        // 1. 이미지뷰 초기화 -> 준비 이미지
        comImageView.image = #imageLiteral(resourceName: "ready") // #imageLiteral(
        userImageView.image = UIImage(named: "ready.png")
        
        // 2. 레이블 초기화 -> 준비 문자열 표기
        mainLabel.text = "선택하세요"
        
        comChoiceLabel.text="준비"
        userChoiceLabel.text="준비"
        
        // 3. 사용자 선택정보 초기화
        userPick = nil
        
    }
    
}

