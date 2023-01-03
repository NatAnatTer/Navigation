//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var printedText = ""
    
    let profileHeader: UIView = {
        return ProfileHeaderView().getRootView
    }()
    
    let somthingButton: UIButton = {
        return ProfileHeaderView().somethingButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        printedText = ProfileHeaderView().statusText
        let safeLayout = self.view.safeAreaLayoutGuide
        addAllSubwiew()
        setupAllView(safeLayout)
        ProfileHeaderView().setStatusButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    @objc private func pressShowStatus(){
        print(printedText)
        print("something")
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
    
    private func addAllSubwiew(){
        self.view.addSubview(self.profileHeader)
        self.view.addSubview(self.somthingButton)
        
    }
    private func setupAllView(_ safeLayout:UILayoutGuide){
        setupProfileHeaderView(safeLayout)
        setupSomethingButton(safeLayout)
    }
    
    private func setupProfileHeaderView(_ safeLayout:UILayoutGuide){
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            profileHeader.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            profileHeader.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0)])
        
        //profileHeader.setStatusButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
//        ProfileHeaderView().setStatusButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
    }
    
    private func setupSomethingButton(_ safeLayout:UILayoutGuide){
        
        NSLayoutConstraint.activate([
            somthingButton.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            somthingButton.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            somthingButton.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: 0)])
    }
    
}



