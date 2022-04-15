//
//  ViewController.swift
//  LoginProject
//
//  Created by Ho bin Lee on 2022/04/15.
//

import UIKit

class ViewController: UIViewController {

    let emailTextFieldview = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        makeUi()
        
    }

    func makeUi(){
        
        emailTextFieldview.backgroundColor = UIColor.darkGray
        
        view.addSubview(emailTextFieldview)
        
        //자동 오토레이아웃 끄기
        emailTextFieldview.translatesAutoresizingMaskIntoConstraints = false
        //상단
        emailTextFieldview.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        //하단 emailTextFieldview.bottomAnchor
        //좌측
        emailTextFieldview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        //우측
        emailTextFieldview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        //높이
        emailTextFieldview.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}

