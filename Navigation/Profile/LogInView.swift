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
        let view = UITextView(frame: .zero) //CGRect(x: 5, y: 5, width: 500, height: 40))
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
        let view = UITextView(frame: .zero) //CGRect(x: 5, y: 5, width: 500, height: 40))
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
  
//    let logoTwoView:UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = UIImage(named: "logo")
//        view.contentMode = .scaleAspectFill
//        view.layer.masksToBounds = true
//        return view
//    }()
//    let logoThreeView:UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = UIImage(named: "logo")
//        view.contentMode = .scaleAspectFill
//        view.layer.masksToBounds = true
//        return view
//    }()
//    let logoFourView:UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = UIImage(named: "logo")
//        view.contentMode = .scaleAspectFill
//        view.layer.masksToBounds = true
//        return view
//    }()
    
    
//    let loginPasswordView: UITableView = {
//        let view = UITableView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemGray6
//         view.layer.cornerRadius = 10
//         view.layer.borderWidth = 0.5
//         view.layer.borderColor = UIColor.lightGray.cgColor
//        return view
//    }()
    
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
//        self.addSubview(logoView)
//        self.addSubview(loginExampleView)
//        self.addSubview(loginPasswordView)
//        self.addSubview(logInButtonView)
        rootView.addSubview(logoView)
        rootView.addSubview(loginEnterView)
        rootView.addSubview(passwordEnterView)
     //   rootView.addSubview(loginPasswordView)
        rootView.addSubview(logInButtonView)
//        rootView.addSubview(logoTwoView)
//        rootView.addSubview(logoThreeView)
//        rootView.addSubview(logoFourView)
   }
    
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: self.topAnchor),
            rootView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rootView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
//            logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
//            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            logoView.heightAnchor.constraint(equalToConstant: 100),
//            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            
//            loginExampleView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 16),
//            loginExampleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            loginExampleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            loginEnterView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120), //120 correctly
            loginEnterView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 20),
            loginEnterView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -20),
            loginEnterView.heightAnchor.constraint(equalToConstant: 50),
            
            passwordEnterView.topAnchor.constraint(equalTo: loginEnterView.bottomAnchor, constant: 0),
            passwordEnterView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 20),
            passwordEnterView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -20),
            passwordEnterView.heightAnchor.constraint(equalToConstant: 50),

            
//            logInButtonView.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 16),
//            logInButtonView.heightAnchor.constraint(equalToConstant: 50),
//            logInButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            logInButtonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            
    //        logInButtonView.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 16),
            logInButtonView.topAnchor.constraint(equalTo: passwordEnterView.bottomAnchor, constant: 16),
            logInButtonView.heightAnchor.constraint(equalToConstant: 50),
            logInButtonView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 16),
            logInButtonView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -16)
//
//
//            logoTwoView.topAnchor.constraint(equalTo: logInButtonView.topAnchor, constant: 120),
//            logoTwoView.centerXAnchor.constraint(equalTo: logInButtonView.centerXAnchor),
//            logoTwoView.heightAnchor.constraint(equalToConstant: 100),
//            logoTwoView.widthAnchor.constraint(equalToConstant: 100),
//
//            logoThreeView.topAnchor.constraint(equalTo: logoTwoView.topAnchor, constant: 120),
//            logoThreeView.centerXAnchor.constraint(equalTo: logoTwoView.centerXAnchor),
//            logoThreeView.heightAnchor.constraint(equalToConstant: 100),
//            logoThreeView.widthAnchor.constraint(equalToConstant: 100),
//
//            logoFourView.topAnchor.constraint(equalTo: logoThreeView.topAnchor, constant: 120),
//            logoFourView.centerXAnchor.constraint(equalTo: logoThreeView.centerXAnchor),
//            logoFourView.heightAnchor.constraint(equalToConstant: 100),
//            logoFourView.widthAnchor.constraint(equalToConstant: 100)
            
          
            
        ])
    }
    
    
    
}

//class TableViewCell: UITableViewCell{
//
//    let loginEnterView: UITextView = {
//        let view = UITextView(frame: CGRect(x: 5, y: 5, width: 500, height: 40))
//        view.textColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.font = .systemFont(ofSize: 16)
//        view.backgroundColor = .systemGray6
//       // view.text.foregroundStyle(UIColor.accentColor)
//      //  view.tintColor //TODO не нашла что за цвет
//        view.text = "Email or phone"
//    //    view.textColor = UIColor.lightGray
//        view.autocapitalizationType = .none
//        return view
//    }()
//
//
//    let passwordEnterView: UITextView = {
//        let view = UITextView(frame: CGRect(x: 5, y: 5, width: 500, height: 40))
//        view.textColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.font = .systemFont(ofSize: 16)
//      //  view.tintColor //TODO не нашла что за цвет
//        view.text = "Password"
//        view.isSecureTextEntry = true
//        view.backgroundColor = .systemGray6
//        view.autocapitalizationType = .none
//        return view
//    }()
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
//        super .init(style: style, reuseIdentifier: reuseIdentifier)
//   contentView.addSubview(loginEnterView)
//       contentView.addSubview(passwordEnterView)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}







//class LogInView: UIView {
//
//    let rootView:UIView = {
//        let view = UIView(frame: .zero)
//        view.backgroundColor = .lightGray
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    let logoView:UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = UIImage(named: "logo")
//        view.contentMode = .scaleAspectFill
//        view.layer.masksToBounds = true
//        return view
//    }()
//
//    let loginExampleView: UITextView = {
//        let view = UITextView(frame: CGRect(x: 5, y: 5, width: 500, height: 40))
//        view.textColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.font = .systemFont(ofSize: 16)
//        view.backgroundColor = .systemGray6
//       // view.text.foregroundStyle(UIColor.accentColor)
//      //  view.tintColor //TODO не нашла что за цвет
//        view.text = "Email or phone"
//    //    view.textColor = UIColor.lightGray
//        view.autocapitalizationType = .none
//        return view
//    }()
//
//
//
//    let loginPasswordView: UITableView = {
//        let view = UITableView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemGray6
//         view.layer.cornerRadius = 10
//         view.layer.borderWidth = 0.5
//         view.layer.borderColor = UIColor.lightGray.cgColor
//        return view
//    }()
//
//    let logInButtonView: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemMint
//      // button.setImage(UIImage(named: "bluePixel"), for: .normal)
//        button.layer.cornerRadius = 10.0
//
//        button.setTitle("LogIn", for: .normal)
//
//        return button
//
//    }()
//
//
//    override init(frame: CGRect){
//        super .init(frame: frame)
//        addAllSubview()
//        setupAllView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//extension LogInView{
//
//    private func addAllSubview(){
//        self.addSubview(rootView)
////        self.addSubview(logoView)
////        self.addSubview(loginExampleView)
////        self.addSubview(loginPasswordView)
////        self.addSubview(logInButtonView)
//        rootView.addSubview(logoView)
//        rootView.addSubview(loginExampleView)
//        rootView.addSubview(loginPasswordView)
//        rootView.addSubview(logInButtonView)
//    }
//
//
//    private func setupAllView(){
//        NSLayoutConstraint.activate([
//            rootView.topAnchor.constraint(equalTo: self.topAnchor),
//            rootView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            rootView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            rootView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//
////            logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
////            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
////            logoView.heightAnchor.constraint(equalToConstant: 100),
////            logoView.widthAnchor.constraint(equalToConstant: 100),
//            logoView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 120),
//            logoView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
//            logoView.heightAnchor.constraint(equalToConstant: 100),
//            logoView.widthAnchor.constraint(equalToConstant: 100),
//
////            loginExampleView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 16),
////            loginExampleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
////            loginExampleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//
//            loginExampleView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 16),
//            loginExampleView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 20),
//            loginExampleView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -20),
//
//
//
////            loginPasswordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
////            loginPasswordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
////            loginPasswordView.heightAnchor.constraint(equalToConstant: 100),
//////            loginPasswordView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
////            loginPasswordView.topAnchor.constraint(equalTo: loginExampleView.bottomAnchor, constant: 120),
//
//
//            loginPasswordView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 16),
//            loginPasswordView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -16),
//            loginPasswordView.heightAnchor.constraint(equalToConstant: 100),
////            loginPasswordView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
//            loginPasswordView.topAnchor.constraint(equalTo: loginExampleView.bottomAnchor, constant: 120),
//
//
//
////            logInButtonView.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 16),
////            logInButtonView.heightAnchor.constraint(equalToConstant: 50),
////            logInButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
////            logInButtonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
//
//            logInButtonView.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 16),
//            logInButtonView.heightAnchor.constraint(equalToConstant: 50),
//            logInButtonView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 16),
//            logInButtonView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -16)
//        ])
//    }
//
//
//
//}
//
//class TableViewCell: UITableViewCell{
//
//    let loginEnterView: UITextView = {
//        let view = UITextView(frame: CGRect(x: 5, y: 5, width: 500, height: 40))
//        view.textColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.font = .systemFont(ofSize: 16)
//        view.backgroundColor = .systemGray6
//       // view.text.foregroundStyle(UIColor.accentColor)
//      //  view.tintColor //TODO не нашла что за цвет
//        view.text = "Email or phone"
//    //    view.textColor = UIColor.lightGray
//        view.autocapitalizationType = .none
//        return view
//    }()
//
//
//    let passwordEnterView: UITextView = {
//        let view = UITextView(frame: CGRect(x: 5, y: 5, width: 500, height: 40))
//        view.textColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.font = .systemFont(ofSize: 16)
//      //  view.tintColor //TODO не нашла что за цвет
//        view.text = "Password"
//        view.isSecureTextEntry = true
//        view.backgroundColor = .systemGray6
//        view.autocapitalizationType = .none
//        return view
//    }()
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
//        super .init(style: style, reuseIdentifier: reuseIdentifier)
//   contentView.addSubview(loginEnterView)
//       contentView.addSubview(passwordEnterView)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
