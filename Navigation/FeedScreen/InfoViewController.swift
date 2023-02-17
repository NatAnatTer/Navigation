//
//  InfoViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 10.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var postDetail = Post(titleOfPost: "Default", descriptionOfPost: "My first post", imageOfPost: "postOne", likes: 1, views: 3, isShortDecription: true)
    
    private lazy var allertButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.setTitle(getStrings(stringsEnum: .delPost), for: .normal)
        button.layer.cornerRadius = CGFloat(getSizesOfElements(sizeEnum: .cornerRadius12))
        button.setTitleColor(.systemGreen, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(getSizesOfElements(sizeEnum: .fontSize20)))
        button.addTarget(self, action: #selector(pressAllertButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButtonAllert()
        
    }
    
    private func setupView() {
        self.view.backgroundColor = .orange
        
    }
    private func setupButtonAllert(){
        self.view.addSubview(self.allertButton)
        self.allertButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:  -200).isActive = true
        self.allertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.allertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.allertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc private func pressAllertButton(){
        showOurAllert(text: self.postDetail.titleOfPost)
    }
    private  func showOurAllert(text: String) {
        
        let alert = UIAlertController(title: getStrings(stringsEnum: .deletePost), message: text, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: getStrings(stringsEnum: .yes), style: UIAlertAction.Style.default, handler: { _ in
            print(getStrings(stringsEnum: .deletedPost))
        }))
        alert.addAction(UIAlertAction(title: getStrings(stringsEnum: .no),
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            print(getStrings(stringsEnum: .didntDeletePost))
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
