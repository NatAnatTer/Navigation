//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталья Терзьян on 13.12.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    lazy var statusText: String = "Waiting for something beautiful, pretty good"
    static let id = "ProfileHeaderView"
    
    let profileIconView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "profileIcon")
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
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
    
    let statusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.setTitle("Show status", for: .normal)
        return button
    }()
    
    let somethingButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.systemCyan.cgColor
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.setTitle("Some text", for: .normal)
        return button
    }()
    
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .systemGray6
        addAllSubwiew()
        setupAllView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension ProfileHeaderView{
    
    private func addAllSubwiew(){
        self.contentView.addSubview(self.profileIconView)
        self.contentView.addSubview(self.fullNameLabel)
        self.contentView.addSubview(self.statusLabel)
        self.contentView.addSubview(self.statusButton)
    }
    
    private func setupAllView(){
        
        NSLayoutConstraint.activate([
            profileIconView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            profileIconView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            profileIconView.heightAnchor.constraint(equalToConstant: 100),
            profileIconView.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusLabel.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15),
            statusLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            statusButton.topAnchor.constraint(equalTo: profileIconView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20)
        ])
    }
    
    
    
    
}


//    
//    lazy var statusText: String = "Waiting for something beautiful, pretty good"
//    
//    let profileIconView: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = UIImage(named: "profileIcon")
//        view.layer.cornerRadius = 50
//        view.layer.borderWidth = 3
//        view.layer.borderColor = UIColor.white.cgColor
//        view.contentMode = .scaleAspectFill
//        view.layer.masksToBounds = true
//        return view
//    }()
//    
//    let fullNameLabel: UILabel = {
//        let view = UILabel(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.text = "Hipster Cat"
//        view.textColor = .black
//        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        return view
//    }()
//    
//    let statusLabel: UILabel = {
//        let view = UILabel(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.text = "Waiting for something beautiful, pretty good"
//        view.textColor = .gray
//        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        return view
//    }()
//    
//    let statusButton: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 10.0
//        button.layer.borderWidth = 2.0
//        button.layer.borderColor = UIColor.systemBlue.cgColor
//        button.layer.shadowRadius = 4.0
//        button.layer.shadowOpacity = 0.7
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
//        button.setTitle("Show status", for: .normal)
//        return button
//    }()
//    
//    let somethingButton: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemCyan
//        button.layer.cornerRadius = 10.0
//        button.layer.borderWidth = 2.0
//        button.layer.borderColor = UIColor.systemCyan.cgColor
//        button.layer.shadowRadius = 4.0
//        button.layer.shadowOpacity = 0.7
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
//        button.setTitle("Some text", for: .normal)
//        return button
//    }()
//    
//    override init(frame: CGRect){
//        super .init(frame: frame)
//        addAllSubwiew()
//        setupAllView()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//extension ProfileHeaderView{
//    
//    private func addAllSubwiew(){
//        self.addSubview(self.profileIconView)
//        self.addSubview(self.fullNameLabel)
//        self.addSubview(self.statusLabel)
//        self.addSubview(self.statusButton)
//    }
//    
//    private func setupAllView(){
//        
//        NSLayoutConstraint.activate([
//            profileIconView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            profileIconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            profileIconView.heightAnchor.constraint(equalToConstant: 100),
//            profileIconView.widthAnchor.constraint(equalToConstant: 100),
//            
//            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
//            fullNameLabel.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15),
//            
//            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
//            statusLabel.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15),
//            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            
//            statusButton.topAnchor.constraint(equalTo: profileIconView.bottomAnchor, constant: 16),
//            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            statusButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//}
