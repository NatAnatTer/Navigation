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
        self.view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        
        let safeLayout = self.view.safeAreaLayoutGuide
        setupProfileHeaderView(safeLayout)
        setupProfileIcon()
        setupNameView()
        setupShowStatusView()
        setupDescriptionView()
        setupSomethingButton(safeLayout)
        
        printedText = ProfileHeaderView().statusText
        showStatusView.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
        
    }
    
    
    
    private let nameView: UILabel = {
        let view = ProfileHeaderView().fullNameLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionView: UILabel = {
        let view = ProfileHeaderView().statusLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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

extension ProfileViewController{
    
    func setupProfileHeaderView(_ safeLayout:UILayoutGuide){
        self.view.addSubview(self.profileHeaderView)
        profileHeaderView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0).isActive = true
        profileHeaderView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0).isActive = true
        profileHeaderView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0).isActive = true
        profileHeaderView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }
    func setupProfileIcon(){
        self.view.addSubview(self.profileIconView)
        profileIconView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16).isActive = true
        profileIconView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16).isActive = true
        profileIconView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileIconView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    func setupNameView(){
        self.view.addSubview(self.nameView)
        nameView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27).isActive = true
        nameView.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15).isActive = true
    }
    func setupDescriptionView(){
        self.view.addSubview(self.descriptionView)
        descriptionView.bottomAnchor.constraint(equalTo: showStatusView.topAnchor, constant: -34).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16).isActive = true
    }
    func setupShowStatusView(){
        self.view.addSubview(self.showStatusView)
        showStatusView.topAnchor.constraint(equalTo: profileIconView.bottomAnchor, constant: 16).isActive = true
        showStatusView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16).isActive = true
        showStatusView.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16).isActive = true
        showStatusView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSomethingButton(_ safeLayout:UILayoutGuide){
        self.view.addSubview(self.showSomethingButton)
        showSomethingButton.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0).isActive = true
        showSomethingButton.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0).isActive = true
        showSomethingButton.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: 0).isActive = true
    }
    
}



