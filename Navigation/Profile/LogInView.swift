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
    
    let loginEnterView: UITextView = {
        let view = UITextView(frame: .zero)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        //  view.text.foregroundStyle(UIColor.accentColor)
        //  view.tintColor //TODO не нашла что за цвет
        view.text = "Email or phone"
        //    view.textColor = UIColor.lightGray
        view.autocapitalizationType = .none
        return view
    }()
    
    let passwordEnterView: UITextView = {
        let view = UITextView(frame: .zero)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
        view.text = "Password"
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.isSecureTextEntry = true
       
        view.backgroundColor = .systemGray6
        view.autocapitalizationType = .none
        return view
    }()
    
    
    let logInButtonView: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        //button.setImage(UIImage(named: "BluePixel"), for: .normal)
        //  button.alpha = 0.8
        // CGFloat  (0.8, strategy: .selected)
        // CGFloat(value: 0.8, for: .selected)
        
        // 0.8 for: .selected
        //        button.contentVerticalAlignment = .fill
        //        button.contentHorizontalAlignment = .fill
        
        
        
        //  button.imageView?.contentMode = .scaleAspectFit
        //  button.imageEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 3, right: 1)
        //   button.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        button.layer.cornerRadius = 10.0
        
        button.setTitle("LogIn", for: .normal)
        
        return button
        
    }()
    
//    let passwordTwoEnterView: UITextView = {
//        let view = UITextView(frame: .zero)
//        view.textColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.font = .systemFont(ofSize: 16)
//        view.text = "Password"
//        view.layer.cornerRadius = 10
//        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.isSecureTextEntry = true
//       
//        view.backgroundColor = .systemGray6
//        view.autocapitalizationType = .none
//        return view
//    }()
//    
    
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
        self.addSubview(rootView)
//        rootView.addSubview(self.logoView)
//        rootView.addSubview(self.loginEnterView)
//        rootView.addSubview(self.passwordEnterView)
//        rootView.addSubview(self.logInButtonView)
        
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

        ])
    }
    
    
    
}

