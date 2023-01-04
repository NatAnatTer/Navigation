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
        self.view.addSubview(profileHeader.rootView)
        self.view.addSubview(profileHeader.somethingButton)
    }
    private func setupAllView(_ safeLayout:UILayoutGuide){
        setupProfileHeaderView(safeLayout)
        setupSomethingButton(safeLayout)
    }
    
    private func setupProfileHeaderView(_ safeLayout:UILayoutGuide){
        
        profileHeader.rootView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.rootView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            profileHeader.rootView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            profileHeader.rootView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0)])
    }
    
    private func setupSomethingButton(_ safeLayout:UILayoutGuide){
        profileHeader.somethingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.somethingButton.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 10),
            profileHeader.somethingButton.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -10),
            profileHeader.somethingButton.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -5)])
    }
    
    private func pressButtons(){
        profileHeader.statusButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
        profileHeader.somethingButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
    }
    
}



