//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    
    var printedText = ""
    
    let postLine: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let identifire  = "PostTableViewCell"
 
    let arrayOfPost:[Post] = [postOne, postTwo, postThree, postFour]
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
        }
        private func setupView() {
            self.view.backgroundColor = .systemGray6
            self.navigationItem.title = "Профиль"
            printedText = ProfileHeaderView().statusText
            let safeLayout = self.view.safeAreaLayoutGuide
            addAllSubviews()
            setupAllViews(safeLayout)
            createTable()
          
           // pressButtons()
        }
    private func createTable(){
        
        self.postLine.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        self.postLine.delegate = self
        self.postLine.dataSource = self
        self.postLine.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.id)
                // self.loginPasswordView.delegate = UITableViewDelegate()
        
        
    }
    

}
extension ProfileViewController:  UITableViewDelegate, UITableViewDataSource{
  
    private func addAllSubviews(){
        self.view.addSubview(postLine)
    }
    
    private func setupAllViews(_ safeLayout: UILayoutGuide){
        NSLayoutConstraint.activate([
            postLine.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
            postLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            postLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            postLine.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10)
        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let postList = arrayOfPost[indexPath.row]
       // cell.text
        cell.accessoryType = .detailButton //add accessory type change
      //  return arrayOfPost[section].count
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        postLine.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id)
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        postLine.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.id)!.intrinsicContentSize.height
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        
//    }
    
}

//    var printedText = ""
//    let profileHeader = ProfileHeaderView(frame: .zero)
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//    }
//
//    private func setupView() {
//        self.view.backgroundColor = .white
//        self.navigationItem.title = "Профиль"
//        printedText = ProfileHeaderView().statusText
//        let safeLayout = self.view.safeAreaLayoutGuide
//        addAllSubwiew()
//        setupAllView(safeLayout)
//        pressButtons()
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//    }
//
//    @objc private func pressShowStatus(){
//        print(printedText)
//    }
//}
//
//extension UIResponder {
//    func responderChain() -> String{
//        guard let next = next else {
//            return String(describing: Self.self)
//        }
//        return String(describing: Self.self) + " -> " + next.responderChain()
//    }
//}
//
//extension ProfileViewController{
//
//    private func addAllSubwiew(){
//        self.view.addSubview(profileHeader)
//        self.view.addSubview(profileHeader.somethingButton)
//    }
//
//    private func setupAllView(_ safeLayout:UILayoutGuide){
//
//        profileHeader.translatesAutoresizingMaskIntoConstraints = false
//        profileHeader.somethingButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            profileHeader.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
//            profileHeader.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
//            profileHeader.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
//            profileHeader.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -50),
//
//            profileHeader.somethingButton.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 10),
//            profileHeader.somethingButton.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -10),
//            profileHeader.somethingButton.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -5)
//        ])
//    }
//
//    private func pressButtons(){
//        profileHeader.statusButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
//        profileHeader.somethingButton.addTarget(self, action: #selector(pressShowStatus), for: .touchUpInside)
//    }
//}


