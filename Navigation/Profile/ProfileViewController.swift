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
        
      //  profileHeaderView.addSubview(profileIconView)
        self.view.addSubview(profileIconView)

        let nameView = ProfileHeaderView().fullNameLabel
       // profileHeaderView.addSubview(nameView)
        self.view.addSubview(nameView)
        
        let descriptionView = ProfileHeaderView().statusLabel
        //profileHeaderView.addSubview(descriptionView)
        self.view.addSubview(descriptionView)
        
      //  profileHeaderView.addSubview(showStatusView)
        self.view.addSubview(showStatusView)
        
        self.view.addSubview(showSomethingButton)
        
        printedText = ProfileHeaderView().statusText
        showStatusView.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)

        let safeLayout = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileIconView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            profileIconView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            profileIconView.heightAnchor.constraint(equalToConstant: 100),
            profileIconView.widthAnchor.constraint(equalToConstant: 100),
            nameView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            nameView.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15),
            descriptionView.bottomAnchor.constraint(equalTo: showStatusView.topAnchor, constant: -34),
            //descriptionView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 34),
            descriptionView.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15),
            descriptionView.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16),
            showStatusView.topAnchor.constraint(equalTo: profileIconView.bottomAnchor, constant: 16),
            showStatusView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            showStatusView.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16),
            showStatusView.heightAnchor.constraint(equalToConstant: 50),
            showSomethingButton.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            showSomethingButton.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            showSomethingButton.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: 0)
        ])
    }
    
    private let profileHeaderView: UIView = {
        let view = ProfileHeaderView()
       let rootView = view.getRootView
        view.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
   
    private let profileIconView: UIImageView = {
       let newIcon = ProfileHeaderView().avatarImageView
        newIcon.layer.cornerRadius = 50
        newIcon.layer.borderWidth = 3
        newIcon.layer.borderColor = UIColor.white.cgColor
        newIcon.contentMode = .scaleAspectFill
        newIcon.layer.masksToBounds = true
        return newIcon
    }()
    
    private let showStatusView:UIButton = {
       let showStatusView = ProfileHeaderView().setStatusButton
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
    
    private let showSomethingButton:UIButton = {
        let view = ProfileHeaderView().somethingButton
        view.setTitle("Some text", for: .normal)
        return view
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





