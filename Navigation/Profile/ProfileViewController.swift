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
    
  //  let identifire  = "PostTableViewCell"
 
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
        
     //   self.postLine.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        self.postLine.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        self.postLine.delegate = self
        self.postLine.dataSource = self
        self.postLine.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.id)
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
        let cell = postLine.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as! PostTableViewCell
        let postList = arrayOfPost[indexPath.row]
        cell.authorOfPost.text = postList.author
       cell.contentOfPost.image = UIImage(named: postList.imageOfPost) //postList.imageOfPost
        cell.descriptionOfPost.text = postList.descriptionOfPost
        cell.likesOfPost.text = "Likes: \(postList.likes)"
        cell.viewsOfPost.text = "Views: \(postList.views)"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        postLine.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id)
    }
    

//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        
//    }
    
}
