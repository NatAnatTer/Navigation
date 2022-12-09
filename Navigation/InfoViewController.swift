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
      
    }
    
    private func setupView() {
        self.view.backgroundColor = .orange
      //  self.navigationController?.title = postDetail.title
  //      self.navigationItem.title = postDetail.title
          
       }

    @objc private func pressAllertButton(){
        let infoViewController = InfoViewController()
    
        self.present(infoViewController, animated: true, completion: nil)
        infoViewController.postDetail = Post(title: titleOfPost)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
