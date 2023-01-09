//
//  LogInViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 04.01.2023.
//

import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate {

    let loginView = LogInView(frame: .zero)
    let scrollView = ScrollViewController()
    
//    let scrollView: UIScrollView = {
//        let view = UIScrollView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000000)
//        return view
//    }()
//    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupView()
     //   scrollView.scrollView.delegate = self
        loginView.loginPasswordView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        loginView.loginPasswordView.dataSource = self
    }
    
    
    private func setupView() {
        self.view.backgroundColor = .white
    //    self.view.backgroundColor = .systemBlue
        let safeLayout = self.view.safeAreaLayoutGuide
        addAllSubwiew()
        setupAllView(safeLayout)
    
    }
    
    @objc private func pressLogIn(){
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }

}



extension LogInViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView{
        case loginView.loginPasswordView:
            return 2
        default:
            return 0
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = loginView.loginPasswordView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

       // cell.textLabel?.text = "1234"
        cell.backgroundColor = .systemGray6
        
        return cell
    }
    
    
    private func addAllSubwiew(){
        self.view.addSubview(loginView)
    
//        self.view.addSubview(scrollView.scrollView)
//        self.scrollView.scrollView.addSubview(loginView)
    }
    
    private func setupAllView(_ safeLayout:UILayoutGuide){
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            scrollView.scrollView.heightAnchor.constraint(equalTo: safeLayout.heightAnchor),
//            scrollView.scrollView.widthAnchor.constraint(equalTo: safeLayout.widthAnchor),
//            scrollView.scrollView.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor),
//            scrollView.scrollView.centerYAnchor.constraint(equalTo: safeLayout.centerYAnchor),
            
            loginView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            loginView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            loginView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0)])
        
    }
    
    private func pressButton(){
        loginView.logInButtonView.addTarget(self, action: #selector(pressLogIn), for: .touchUpInside)
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
