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
        printedText = ProfileHeaderView().statusText
        let safeLayout = self.view.safeAreaLayoutGuide
        setupProfileHeaderView(safeLayout)
        setupSomethingButton(safeLayout)
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
    
    private func setupProfileHeaderView(_ safeLayout:UILayoutGuide){
        
        let profileHeaderView = ProfileHeaderView()
        let rootView = profileHeaderView.getRootView
        self.view.addSubview(rootView)
        rootView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            rootView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            rootView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0)])
        
        profileHeaderView.setStatusButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
    }
    
    private func setupSomethingButton(_ safeLayout:UILayoutGuide){
        let button = ProfileHeaderView().somethingButton
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: 0)])
    }
}



