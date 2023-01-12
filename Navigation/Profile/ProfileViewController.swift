//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var printedText = ""
    let profileHeader = ProfileHeaderView(frame: .zero)
    
    
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
        pressButtons()
    }
    
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
    
    private func addAllSubwiew(){
        self.view.addSubview(profileHeader)
        self.view.addSubview(profileHeader.somethingButton)
    }
    
    private func setupAllView(_ safeLayout:UILayoutGuide){
        
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        profileHeader.somethingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            profileHeader.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            profileHeader.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            profileHeader.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -50),
            
            profileHeader.somethingButton.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 10),
            profileHeader.somethingButton.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -10),
            profileHeader.somethingButton.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -5)
        ])
    }
    
    private func pressButtons(){
        profileHeader.statusButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
        profileHeader.somethingButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
    }
}



