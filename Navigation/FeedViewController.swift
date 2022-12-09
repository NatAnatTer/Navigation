//
//  ViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 05.12.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var postOne = Post(title: "My first post")
    
    private lazy var toPostButton: UIButton = {
          let button = UIButton()
           button.backgroundColor = .systemGray6
           button.setTitle("Пост", for: .normal)
           button.layer.cornerRadius = 12
           button.setTitleColor(.systemCyan, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
           button.addTarget(self, action: #selector(pressPost), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtonPost()
        

//        let toPostButton = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 40))

    }
    
    private func setupView() {
           self.view.backgroundColor = .systemMint
           self.navigationItem.title = "Лента"
       }
    
    private func setupButtonPost(){
        self.view.addSubview(self.toPostButton)
        self.toPostButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:  -200).isActive = true
        self.toPostButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.toPostButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.toPostButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
       
    }
    
    @objc private func pressPost(){
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titleOfPost = postOne.title
       
        print("Open post")
    }


}

