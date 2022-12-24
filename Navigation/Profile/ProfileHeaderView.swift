//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталья Терзьян on 13.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var statusText: String = "Waiting for something beautiful, pretty good"
    
    init(){
        super .init(frame: .zero)
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let getRootView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemFill
        return view
    }()
    
    let avatarImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "profileIcon")
        return view
    }()
    
    let fullNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hipster Cat"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }()
    
    let statusLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Waiting for something beautiful, pretty good"
        view.textColor = .gray
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return view
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let somethingButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemCyan
        return button
    }()
    
}
