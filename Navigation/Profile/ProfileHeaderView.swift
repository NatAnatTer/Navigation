//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталья Терзьян on 13.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var statusText: String = "Waiting for something beautiful, pretty good"
    
   
    
    let getRootView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemFill
        return view
    }()
    
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
    
    let setStatusButton: UIButton = {
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
        button.setTitle("Some text", for: .normal)
        return button
    }()
    
    override init(frame: CGRect){
        super .init(frame: frame)
        self.backgroundColor = .systemFill
        addAllSubwiew()
        setupAllView()
    }
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ProfileHeaderView{
    private func addAllSubwiew(){
        
        getRootView.addSubview(self.profileIconView)
        getRootView.addSubview(self.fullNameLabel)
        getRootView.addSubview(self.statusLabel)
        getRootView.addSubview(self.setStatusButton)
    }
    private func setupAllView(){
        setupProfileHeaderView()
        setupProfileIcon()
        setupNameView()
        setupDescriptionView()
        setupShowStatusView()
    }
    
    private func setupProfileHeaderView(){
        NSLayoutConstraint.activate([
            getRootView.heightAnchor.constraint(equalToConstant: 220)])
    }
    
    private func setupProfileIcon(){
        NSLayoutConstraint.activate([
            profileIconView.topAnchor.constraint(equalTo: getRootView.topAnchor, constant: 16),
            profileIconView.leadingAnchor.constraint(equalTo: getRootView.leadingAnchor, constant: 16),
            profileIconView.heightAnchor.constraint(equalToConstant: 100),
            profileIconView.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    private func setupNameView(){
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: getRootView.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15)])
    }
    
    func setupDescriptionView(){
        NSLayoutConstraint.activate([
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            statusLabel.leadingAnchor.constraint(equalTo: profileIconView.trailingAnchor, constant: 15),
            statusLabel.trailingAnchor.constraint(equalTo: getRootView.trailingAnchor, constant: -16)])
    }
    
    func setupShowStatusView(){
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: profileIconView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: getRootView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: getRootView.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}
