//
//  LogInView.swift
//  Navigation
//
//  Created by Наталья Терзьян on 04.01.2023.
//

import UIKit

class LogInView: UIView {

    let logoView:UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
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
      //  button.setImage(UIImage(named: "bluePixel"), for: .normal)
        button.layer.cornerRadius = 10.0
        button.setTitle("LogIn", for: .normal)
        return button
        
    }()
    
  
    override init(frame: CGRect){
        super .init(frame: frame)
        addAllSubview()
        setupAllView()
    //    self.loginPasswordView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
       // self.loginPasswordView.delegate = UITableViewDelegate()
     //   self.loginPasswordView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension LogInView{
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch tableView{
//        case self.loginPasswordView:
//            return 30
//        default:
//            return 0
//        }
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.loginPasswordView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
//
//        cell.textLabel?.text = "1234"
//
//        return cell
//    }
//
    private func addAllSubview(){
//
//        scrollView.addSubview(logoView)
//        scrollView.addSubview(loginPasswordView)
//        self.addSubview(scrollView)
        
        
        self.addSubview(logoView)
        self.addSubview(loginPasswordView)
        self.addSubview(logInButtonView)
    }
    
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            
            
            loginPasswordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginPasswordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            loginPasswordView.heightAnchor.constraint(equalToConstant: 100),
            loginPasswordView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            
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
        view.text = "Login"
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
