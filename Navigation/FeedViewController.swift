//
//  ViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 05.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var postOne = PostFirst(title: "My first post")
    
    private lazy var toPostButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Пост", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(pressPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var toPostButtonTwo: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Пост 2", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(pressPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.navigationItem.title = "Лента"
        
        setupButtonPost()
        setupButtonPostTwo()
        setupStackView()
    }
    
    @objc private func pressPost(){
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titleOfPost = postOne.title
        
        print("Open post")
    }
}

extension FeedViewController{
    private func setupStackView(){
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering //TODO
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(toPostButton)
        stackView.addArrangedSubview(toPostButtonTwo)
    }
    
    private func setupButtonPost(){
        self.view.addSubview(self.toPostButton)
        self.toPostButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.toPostButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    private func setupButtonPostTwo(){
        self.view.addSubview(self.toPostButton)
        self.toPostButtonTwo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.toPostButtonTwo.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
