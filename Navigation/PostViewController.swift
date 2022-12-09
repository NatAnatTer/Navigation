//
//  PostViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class PostViewController: UIViewController {

  //  private lazy var infoButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(openInfo()))
    
   // UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(openInfo()))
    
    var titleOfPost: String = "Default"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
     //   addInfoButton()
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = infoButton
        
     //   button.addTarget(self, action: #selector(pressPost), for: .touchUpInside)
    }

    private func setupView() {
           self.view.backgroundColor = .lightGray
           self.navigationItem.title = titleOfPost
       // postViewController.titleOfPost = postOne.title
           //self.navigationItem.rightBarButtonItem = UIBarButtonItem
       }
    
//    private func addInfoButton(){
//        self.view.addSubview(self.infoButton)
//    }

    @objc private func openInfo(){
        let infoViewController = InfoViewController()
     //   self.navigationController?.pushViewController(infoViewController, animated: true)
        self.present(infoViewController, animated: true, completion: nil)
        infoViewController.postDetail = Post(title: titleOfPost)
    }
    
}
