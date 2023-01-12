//
//  LogInViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 04.01.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
  //  let loginView = LogInView(frame: .zero)
    
    let scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
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
        button.clipsToBounds = true
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.scrollView.keyboardDismissMode = .interactive
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
       self.navigationController?.isNavigationBarHidden = true
        //self.tabBarController?.tabBar.isHidden = true
        subscrabeKeyboardEvents()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
     //   navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        let safeLayout = self.view.safeAreaLayoutGuide
        addAllSubwiew()
        setupAllView(safeLayout)
        pressButtons()
        
    }
    
    @objc private func pressLogIn(){
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}

extension LogInViewController{
    
    private func addAllSubwiew(){
        
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(self.logoView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(loginEnterView)
        stackView.addArrangedSubview(logInButtonView)
        scrollView.addSubview(self.loginEnterView)
        scrollView.addSubview(self.passwordEnterView)
        scrollView.addSubview(self.logInButtonView)
        //scrollView.addSubview(loginView)
    }
    
 //   private func setupStackView(){
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering //TODO
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
     //   self.view.addSubview(stackView)
//        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
//        stackView.addArrangedSubview(loginEnterView)
//        stackView.addArrangedSubview(logInButtonView)
        return stackView
    }()
    
    private func setupAllView(_ safeLayout:UILayoutGuide){
        
    //    loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.heightAnchor.constraint(equalTo: safeLayout.heightAnchor, constant: 0),
            self.scrollView.widthAnchor.constraint(equalTo: safeLayout.widthAnchor, constant: 0),
            self.scrollView.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor, constant: 0),
            self.scrollView.centerYAnchor.constraint(equalTo: safeLayout.centerYAnchor, constant: 0),
            
            
            self.logoView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            self.logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logoView.heightAnchor.constraint(equalToConstant: 100),
            self.logoView.widthAnchor.constraint(equalToConstant: 100),
            
            self.loginEnterView.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 120),
            self.loginEnterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.loginEnterView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.loginEnterView.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordEnterView.topAnchor.constraint(equalTo: self.loginEnterView.bottomAnchor, constant: 0),
            self.passwordEnterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.passwordEnterView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.passwordEnterView.heightAnchor.constraint(equalToConstant: 50),
            
            self.logInButtonView.topAnchor.constraint(equalTo: self.passwordEnterView.bottomAnchor, constant: 16),
            self.logInButtonView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.logInButtonView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.logInButtonView.heightAnchor.constraint(equalToConstant: 50)
            
            
            
//            loginView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0),
//            loginView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0),
//            loginView.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
//            loginView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    private func pressButtons(){
      //  loginView.logInButtonView.addTarget(self, action: #selector(pressLogIn), for: .touchUpInside)
        logInButtonView.addTarget(self, action: #selector(pressLogIn), for: .touchUpInside)
    }
    
    func subscrabeKeyboardEvents(){
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func KeyboardWillShow(_ notification: NSNotification){
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification){
        self.scrollView.contentInset = .zero
    }
    
}
