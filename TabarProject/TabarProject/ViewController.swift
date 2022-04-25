//
//  ViewController.swift
//  TabarProject
//
//  Created by Ho bin Lee on 2022/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize:20, weight: .bold)
        
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func setUp(){
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.625027597, blue: 0.03537470475, alpha: 1)
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            
    }
    
    @objc func loginButtonTapped() {
        dismiss(animated: true, completion: nil)
    }


}

