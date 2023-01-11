//
//  LogInView.swift
//  Navigation
//
//  Created by Наталья Терзьян on 04.01.2023.
//

import UIKit

class LogInView: UIView {
    
    let rootView:UIView = {
        let view = UIView(frame: .zero)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoView:UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    let loginEnterView: UITextField = {
        let view = UITextField(frame: .zero)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.textContentType = .username
        view.keyboardType = .emailAddress
        view.placeholder = "Email or phone"
                view.contentHorizontalAlignment = .fill
        view.autocapitalizationType = .none
        return view
    }()
    
    let passwordEnterView: UITextField = {
        let view = UITextField(frame: .zero)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
        view.placeholder = "Password"
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.isSecureTextEntry = true
        view.textContentType = .password
        view.backgroundColor = .systemGray6
        view.autocapitalizationType = .none
        return view
    }()
    
    
    let logInButtonView: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("LogIn", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "BluePixel"), for: .normal)
        button.layer.cornerRadius = 10.0
        switch button.state{
        case .normal: button.alpha = 1
        case .selected: button.alpha = 0.8
        case .highlighted: button.alpha = 0.8
        case .disabled: button.alpha = 0.8
        default: button.alpha = 1
        }
        return button
        
    }()
    

    
    override init(frame: CGRect){
        super .init(frame: frame)
        addAllSubview()
        setupAllView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LogInView{
    
    private func addAllSubview(){
        //self.addSubview(rootView)
//        rootView.addSubview(self.logoView)
//        rootView.addSubview(self.loginEnterView)
//        rootView.addSubview(self.passwordEnterView)
//        rootView.addSubview(self.logInButtonView)
//        
        self.addSubview(self.logoView)
        self.addSubview(self.loginEnterView)
        self.addSubview(self.passwordEnterView)
        self.addSubview(self.logInButtonView)
        
      //  self.addSubview(passwordTwoEnterView)
    }
    
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
//            rootView.topAnchor.constraint(equalTo: self.topAnchor),
//            rootView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            rootView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            rootView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//
//
//            self.logoView.topAnchor.constraint(equalTo: self.rootView.topAnchor, constant: 120),
//            self.logoView.centerXAnchor.constraint(equalTo: self.rootView.centerXAnchor),
//            self.logoView.heightAnchor.constraint(equalToConstant: 100),
//            self.logoView.widthAnchor.constraint(equalToConstant: 100),
//
//            self.loginEnterView.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 120),
//            self.loginEnterView.leadingAnchor.constraint(equalTo: self.rootView.leadingAnchor, constant: 20),
//            self.loginEnterView.trailingAnchor.constraint(equalTo: self.rootView.trailingAnchor, constant: -20),
//            self.loginEnterView.heightAnchor.constraint(equalToConstant: 50),
//
//            self.passwordEnterView.topAnchor.constraint(equalTo: self.loginEnterView.bottomAnchor, constant: 0),
//            self.passwordEnterView.leadingAnchor.constraint(equalTo: self.rootView.leadingAnchor, constant: 20),
//            self.passwordEnterView.trailingAnchor.constraint(equalTo: self.rootView.trailingAnchor, constant: -20),
//            self.passwordEnterView.heightAnchor.constraint(equalToConstant: 50),
//
//            self.logInButtonView.topAnchor.constraint(equalTo: self.passwordEnterView.bottomAnchor, constant: 16),
//            self.logInButtonView.leadingAnchor.constraint(equalTo: self.rootView.leadingAnchor, constant: 16),
//            self.logInButtonView.trailingAnchor.constraint(equalTo: self.rootView.trailingAnchor, constant: -16),
//            self.logInButtonView.heightAnchor.constraint(equalToConstant: 50)

            
            self.logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            self.logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoView.heightAnchor.constraint(equalToConstant: 100),
            self.logoView.widthAnchor.constraint(equalToConstant: 100),

            self.loginEnterView.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 120),
            self.loginEnterView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginEnterView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.loginEnterView.heightAnchor.constraint(equalToConstant: 50),

            self.passwordEnterView.topAnchor.constraint(equalTo: self.loginEnterView.bottomAnchor, constant: 0),
            self.passwordEnterView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordEnterView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.passwordEnterView.heightAnchor.constraint(equalToConstant: 50),

            self.logInButtonView.topAnchor.constraint(equalTo: self.passwordEnterView.bottomAnchor, constant: 16),
            self.logInButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.logInButtonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.logInButtonView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
}

