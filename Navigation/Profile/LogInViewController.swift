//
//  LogInViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 04.01.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    let loginView = LogInView(frame: .zero)
    
    let scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        return view
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
        self.tabBarController?.tabBar.isHidden = true
        subscrabeKeyboardEvents()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
        scrollView.addSubview(loginView.logoView)
        self.view.addSubview(loginView.loginEnterView)
        self.view.addSubview(loginView.passwordEnterView)
        self.view.addSubview(loginView.logInButtonView)
        
     //   self.scrollView.addSubview(self.loginView.rootView)
     //   self.scrollView.addSubview(loginView.passwordTwoEnterView)
    }
    
    private func setupAllView(_ safeLayout:UILayoutGuide){
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.heightAnchor.constraint(equalTo: safeLayout.heightAnchor, constant: 0),
            self.scrollView.widthAnchor.constraint(equalTo: safeLayout.widthAnchor, constant: 0),
            self.scrollView.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor, constant: 0),
            self.scrollView.centerYAnchor.constraint(equalTo: safeLayout.centerYAnchor, constant: 0),
            
            
//            loginView.rootView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0),
//            loginView.rootView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0),
//            loginView.rootView.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
//            loginView.rootView.heightAnchor.constraint(equalToConstant: loginView.rootView.bounds.height),
            
            
            
            
            loginView.logoView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            loginView.logoView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            loginView.logoView.heightAnchor.constraint(equalToConstant: 100),
            loginView.logoView.widthAnchor.constraint(equalToConstant: 100),

            loginView.loginEnterView.topAnchor.constraint(equalTo: loginView.logoView.bottomAnchor, constant: 300), //120
            loginView.loginEnterView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20),
            loginView.loginEnterView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -20),
            loginView.loginEnterView.heightAnchor.constraint(equalToConstant: 50),

            loginView.passwordEnterView.topAnchor.constraint(equalTo: loginView.loginEnterView.bottomAnchor, constant: 0),
            loginView.passwordEnterView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20),
            loginView.passwordEnterView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -20),
            loginView.passwordEnterView.heightAnchor.constraint(equalToConstant: 50),

            loginView.logInButtonView.topAnchor.constraint(equalTo: loginView.passwordEnterView.bottomAnchor, constant: 16),
            loginView.logInButtonView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            loginView.logInButtonView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            loginView.logInButtonView.heightAnchor.constraint(equalToConstant: 50),
            
            
//            loginView.passwordTwoEnterView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
//            loginView.passwordTwoEnterView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
//            loginView.passwordTwoEnterView.heightAnchor.constraint(equalToConstant: 50),
//            loginView.passwordTwoEnterView.widthAnchor.constraint(equalToConstant: 400)
//
        ])
    }
    
    private func pressButtons(){
        loginView.logInButtonView.addTarget(self, action: #selector(pressLogIn), for: .touchUpInside)
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







//override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
// //   self.navigationController?.navigationBar.isHidden = true
////            navigationController?.setNavigationBarHidden(true, animated: true)
////            self.navigationController?.isNavigationBarHidden = true
////            navigationBar.isHidden = true
////           navigationController?.hidesBarsWhenKeyboardAppears = true
//}



//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//     //   navigationController?.setNavigationBarHidden(true, animated: animated)
//        self.navigationController?.isNavigationBarHidden = true
//    }
//TODO не скрылся таб бар

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//     //   navigationController?.setNavigationBarHidden(true, animated: true)
//       // self.navigationController?.isNavigationBarHidden = true
//       // navigationBar.isHidden = true
//      // navigationController?.hidesBarsWhenKeyboardAppears = true
//    }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
//
