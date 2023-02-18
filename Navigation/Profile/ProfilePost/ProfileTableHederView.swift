//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталья Терзьян on 13.12.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    lazy var statusText: String = getStrings(stringsEnum: .statusText)
    static let id = "ProfileHeaderView"
    
   
    
    let profileIconView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: getStrings(stringsEnum: .iconProfile))
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.contentMode = .scaleAspectFill
        view.isOpaque = true
        view.layer.masksToBounds = true
        return view
    }()
    
    let profileIconViewForAnimation: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: getStrings(stringsEnum: .iconProfile))
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.contentMode = .scaleAspectFill
        view.isHidden = true
        view.layer.masksToBounds = true
        return view
    }()
    
    
    
    let fullNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = getStrings(stringsEnum: .nameOfProfile)
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: CGFloat(getSizesOfElements(sizeEnum: .fontSize18)), weight: .bold)
        return view
    }()
    
    let statusLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = getStrings(stringsEnum: .statusText)
        view.textColor = .gray
        view.font = UIFont.systemFont(ofSize: CGFloat(getSizesOfElements(sizeEnum: .fontSize14)), weight: .regular)
        return view
    }()
    
    let statusEnterField: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = .systemFont(ofSize: 15, weight: .regular)
        view.placeholder = getStrings(stringsEnum: .setStatus)
        view.layer.cornerRadius = 12.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.black.cgColor
        view.autocapitalizationType = .none
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftViewMode = .always
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
        button.setTitle(getStrings(stringsEnum: .setStatusButton), for: .normal)
        return button
    }()
    
    
    let blackView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isOpaque = false
        view.alpha = 0.0
        return view
    }()
    let closeButtonView:UIButton = {
        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        view.setBackgroundImage(UIImage(systemName: getStrings(stringsEnum: .iconClose)), for: .normal)
        view.tintColor = .white
        view.layer.opacity = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .systemGray6
        addAllSubwiew()
        setupAllView()
        pressButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ProfileHeaderView{
    
    private func addAllSubwiew(){
        
        self.contentView.addSubview(self.profileIconViewForAnimation)
        self.contentView.addSubview(self.fullNameLabel)
        self.contentView.addSubview(self.statusButton)
        self.contentView.addSubview(self.statusLabel)
        self.contentView.addSubview(self.statusEnterField)
        self.contentView.addSubview(self.blackView)
        self.contentView.addSubview(self.closeButtonView)
        self.contentView.addSubview(self.profileIconView)
        
    }
    

    private func setupAllView(){
        
        NSLayoutConstraint.activate([
            profileIconView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            profileIconView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            profileIconView.heightAnchor.constraint(equalToConstant: 100),
            profileIconView.widthAnchor.constraint(equalToConstant: 100),
            
            profileIconViewForAnimation.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            profileIconViewForAnimation.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            profileIconViewForAnimation.heightAnchor.constraint(equalToConstant: 100),
            profileIconViewForAnimation.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 132),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            statusEnterField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusEnterField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            statusEnterField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 132),
            statusEnterField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            statusEnterField.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            statusButton.topAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -66),
            statusButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusEnterField.topAnchor, constant: -10), //34
            statusLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 132),
            statusLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            blackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            blackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            blackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            closeButtonView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            closeButtonView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
        ])
    }
    
    private func pressButtons(){
        self.closeButtonView.addTarget(self, action: #selector(pressCloseAvatar), for: .touchUpInside)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileIconTapped(tapGestureRecognizer:)))
        self.profileIconView.isUserInteractionEnabled = true
        self.profileIconView.addGestureRecognizer(tapGestureRecognizer)
        
        self.statusButton.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
        self.statusEnterField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        self.statusEnterField.layer.borderColor = UIColor.black.cgColor
      }
    
    @objc private func changeStatus(){
        let text = statusEnterField.text ?? ""
        if text.count == 0 {
            statusEnterField.layer.borderColor = UIColor.red.cgColor
            statusEnterField.placeholder = getStrings(stringsEnum: .enterText)
        } else {
            statusLabel.text = text
            statusEnterField.text = ""
        }
    }
    
    
    @objc private func profileIconTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
        UIImageView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut){
            self.blackView.alpha = 0.7
            
            self.profileIconView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.profileIconView.center = CGPoint(x: self.blackView.center.x, y: self.blackView.center.y - 55)
            
            self.profileIconView.layer.cornerRadius = 0
            self.profileIconView.layer.borderWidth = 0
            
            self.layoutIfNeeded()
        } completion:{ _ in
            UIImageView.animate(withDuration: 0.3, delay: 0){
                self.closeButtonView.layer.opacity = 1
            }
            
        }
        
    }
    
    
    @objc private func pressCloseAvatar(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [.curveEaseOut]){
            self.closeButtonView.alpha = 0.0
        } completion: { _ in
            self.blackView.alpha = 0.0
            self.profileIconView.layer.borderWidth = 3
            self.profileIconView.layer.position = self.profileIconViewForAnimation.layer.position
            self.profileIconView.layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
            self.profileIconView.layer.cornerRadius = self.profileIconView.bounds.width / 2
            self.layoutIfNeeded()
        }
        
    }
}


