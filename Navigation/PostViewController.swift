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
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = infoButton
    }

    private func setupView() {
           self.view.backgroundColor = .lightGray
           self.navigationItem.title = titleOfPost
       }

    @objc private func openInfo(){
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true, completion: nil)
        infoViewController.postDetail = Post(title: titleOfPost)
    }
    
}
