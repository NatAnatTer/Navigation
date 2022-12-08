//
//  ViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 05.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "First VC"
        view.backgroundColor = .systemMint
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.tabBarItem = tabBarItem
    }


}

