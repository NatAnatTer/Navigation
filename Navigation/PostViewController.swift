//
//  PostViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class PostViewController: UIViewController {

    
    var titleOfPost: String = "Default"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: "info", target: self, action: #selector(openInfo()))
    }

    private func setupView() {
           self.view.backgroundColor = .lightGray
           self.navigationItem.title = titleOfPost
           //self.navigationItem.rightBarButtonItem = UIBarButtonItem
       }

    @objc private func openInfo(){
        
    }
    
}
