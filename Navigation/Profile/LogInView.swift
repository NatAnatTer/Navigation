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
        view.backgroundColor = .lightGray
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
    
    let loginExampleView: UITextView = {
        let view = UITextView(frame: CGRect(x: 5, y: 5, width: 500, height: 40))
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
        view.backgroundColor = .systemGray6
       // view.text.foregroundStyle(UIColor.accentColor)
      //  view.tintColor //TODO не нашла что за цвет
        view.text = "Email or phone"
    //    view.textColor = UIColor.lightGray
        view.autocapitalizationType = .none
        return view
    }()

    
    
    let loginPasswordView: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
         view.layer.cornerRadius = 10
         view.layer.borderWidth = 0.5
         view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let logInButtonView: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemMint
      // button.setImage(UIImage(named: "bluePixel"), for: .normal)
        button.layer.cornerRadius = 10.0
        
        button.setTitle("LogIn", for: .normal)
  
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

        self.addSubview(logoView)
        self.addSubview(loginExampleView)
        self.addSubview(loginPasswordView)
        self.addSubview(logInButtonView)
    }
    
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            
            loginExampleView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 16),
            loginExampleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            loginExampleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
            
            loginPasswordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginPasswordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            loginPasswordView.heightAnchor.constraint(equalToConstant: 100),
//            loginPasswordView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            loginPasswordView.topAnchor.constraint(equalTo: loginExampleView.bottomAnchor, constant: 120),
            
            logInButtonView.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 16),
            logInButtonView.heightAnchor.constraint(equalToConstant: 50),
            logInButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            logInButtonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    
    
}

class TableViewCell: UITableViewCell{
    
    let loginEnterView: UITextView = {
        let view = UITextView(frame: CGRect(x: 5, y: 5, width: 500, height: 40))
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
        view.backgroundColor = .systemGray6
       // view.text.foregroundStyle(UIColor.accentColor)
      //  view.tintColor //TODO не нашла что за цвет
        view.text = "Email or phone"
    //    view.textColor = UIColor.lightGray
        view.autocapitalizationType = .none
        return view
    }()
    
    
    let passwordEnterView: UITextView = {
        let view = UITextView(frame: CGRect(x: 5, y: 5, width: 500, height: 40))
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 16)
      //  view.tintColor //TODO не нашла что за цвет
        view.text = "Password"
        view.isSecureTextEntry = true
        view.backgroundColor = .systemGray6
        view.autocapitalizationType = .none
        return view
    }()
    
    let example: UILabel = {
        let view = UILabel(frame: CGRect(x: 5, y: 5, width: 500, height: 20))
        view.textColor = .black
        view.text = "example"
        view.translatesAutoresizingMaskIntoConstraints = false
      //  view.font = .systemFont(ofSize: 16)
      //  view.tintColor //TODO не нашла что за цвет
      //  view.text = "Password"
     //   view.isSecureTextEntry = true
     //   view.autocapitalizationType = .none
        return view
    }()
    
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
   contentView.addSubview(loginEnterView)
       contentView.addSubview(passwordEnterView)
     //   contentView.addSubview(example)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
