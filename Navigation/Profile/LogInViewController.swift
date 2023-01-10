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
        
    //    scrollView.keyboardDismissMode = .interactive
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        subscrabeKeyboardEvents()
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        NotificationCenter.default.removeObserver(self)
//    }
//
    
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
        self.scrollView.addSubview(loginView.rootView)
    }
    
    private func setupAllView(_ safeLayout:UILayoutGuide){
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.heightAnchor.constraint(equalTo: safeLayout.heightAnchor),
            self.scrollView.widthAnchor.constraint(equalTo: safeLayout.widthAnchor),
            self.scrollView.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor),
            self.scrollView.centerYAnchor.constraint(equalTo: safeLayout.centerYAnchor),
            
            
            loginView.rootView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0),
            loginView.rootView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0),
            loginView.rootView.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            loginView.rootView.heightAnchor.constraint(equalToConstant: loginView.rootView.bounds.height)     
            
        ])
    }
    
    private func pressButtons(){
        loginView.logInButtonView.addTarget(self, action: #selector(pressLogIn), for: .touchUpInside)
    }
    
//    func subscrabeKeyboardEvents(){
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc func KeyboardWillShow(_ notification: NSNotification){
//        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
//        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
//    }
//
//    @objc func keyboardWillHide(_ notification: NSNotification){
//        self.scrollView.contentInset = .zero
//    }
    
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
