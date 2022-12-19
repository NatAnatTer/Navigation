//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

  // let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    private func setupView() {
        view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        
        var profileHeader = ProfileHeaderView()
        //self.view.addSubview(profileHeader)
       
       
        let profileView = profileHeader.getRootView()
        self.view.addSubview(profileView)
        let profileIconView = profileHeader.getProfileImageView()
        profileView.addSubview(profileIconView)
        
        profileIconView.layer.cornerRadius = 50
        profileIconView.layer.borderWidth = 3
        profileIconView.layer.borderColor = UIColor.white.cgColor
        profileIconView.contentMode = .scaleAspectFill
        profileIconView.layer.masksToBounds = true
        
        let nameView = profileHeader.getNameView()
        profileView.addSubview(nameView)
        
        
        let descriptionView = profileHeader.getDescriptionView()
        profileView.addSubview(descriptionView)
        
        
        let showStatusView = profileHeader.getShowStatusButton()
        profileView.addSubview(showStatusView)
        showStatusView.layer.cornerRadius = 10.0
        showStatusView.layer.borderWidth = 2.0
        showStatusView.layer.borderColor = UIColor.systemBlue.cgColor
        showStatusView.layer.shadowRadius = 4.0
        showStatusView.layer.shadowOpacity = 0.7
        showStatusView.layer.shadowColor = UIColor.black.cgColor
        showStatusView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        showStatusView.setTitle("Show status", for: .normal)

       // showStatusView.addTarget(self, action: #selector(pressPost), for: .touchUpInside)
        
        
    
       }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //profileHeader.frame = view.frame
        
       
    }
    
    
   
}

extension UIResponder {
    func responderChain() -> String{
        guard let next = next else {
            return String(describing: Self.self)
        }
        return String(describing: Self.self) + " -> " + next.responderChain()
    }
}





