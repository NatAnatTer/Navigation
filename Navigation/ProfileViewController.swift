//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray2
        self.navigationItem.title = "Профиль"
           //self.navigationItem.rightBarButtonItem = UIBarButtonItem
       }
  

}
