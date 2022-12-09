//
//  InfoViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 10.12.2022.
//

import UIKit

class InfoViewController: UIViewController {

    var postDetail = Post(title: "Default")
    
    private lazy var allertButton: UIButton = {
          let button = UIButton()
           button.backgroundColor = .systemGray6
           button.setTitle("Allert button", for: .normal)
           button.layer.cornerRadius = 12
           button.setTitleColor(.systemGray4, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
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
        showOurAllert(text: self.postDetail.title)
    }
    private  func showOurAllert(text: String) {
        let alert = UIAlertController(title: "Хотите удалить пост?", message: text, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { _ in
                print("Удалили пост")
            }))
            alert.addAction(UIAlertAction(title: "No",
                                          style: UIAlertAction.Style.default,
                                          handler: {(_: UIAlertAction!) in
                                            print("Не стали удалять пост")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    
  

}
