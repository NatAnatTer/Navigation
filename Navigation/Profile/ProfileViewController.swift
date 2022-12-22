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
    
    var printedText = ""
    
    private func setupView() {
        view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        
        self.view.addSubview(profileHeaderView)
        
        profileHeaderView.addSubview(profileIconView)

        let nameView = ProfileHeaderView().getNameView
        profileHeaderView.addSubview(nameView)
        
        let descriptionView = ProfileHeaderView().getDescriptionView
        profileHeaderView.addSubview(descriptionView)
        
        profileHeaderView.addSubview(showStatusView)
        
        printedText = ProfileHeaderView().statusText
        showStatusView.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)

    }
    
    private let profileHeaderView: UIView = {
        let view = ProfileHeaderView()
       let rootView = view.getRootView
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
   
    private let profileIconView: UIImageView = {
       let newIcon = ProfileHeaderView().getProfileImageView
        newIcon.layer.cornerRadius = 50
        newIcon.layer.borderWidth = 3
        newIcon.layer.borderColor = UIColor.white.cgColor
        newIcon.contentMode = .scaleAspectFill
        newIcon.layer.masksToBounds = true
        return newIcon
    }()
    
    private let showStatusView:UIButton = {
       let showStatusView = ProfileHeaderView().getShowStatusButton
        showStatusView.layer.cornerRadius = 10.0
        showStatusView.layer.borderWidth = 2.0
        showStatusView.layer.borderColor = UIColor.systemBlue.cgColor
        showStatusView.layer.shadowRadius = 4.0
        showStatusView.layer.shadowOpacity = 0.7
        showStatusView.layer.shadowColor = UIColor.black.cgColor
        showStatusView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        showStatusView.setTitle("Show status", for: .normal)
        return showStatusView
    }()
    
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    @objc private func pressShowStatus(){
        print(printedText)
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





