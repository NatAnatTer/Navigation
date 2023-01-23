//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    
    let arrayOfPost:[Post] = [postOne, postTwo, postThree, postFour]
    let arrayOfPhoto:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    
    let postLine: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.navigationItem.title = "Профиль"
        let safeLayout = self.view.safeAreaLayoutGuide
        addAllSubviews()
        setupAllViews(safeLayout)
        createTable()
    }
    
    private func createTable(){
        self.postLine.delegate = self
        self.postLine.dataSource = self
       // self.postLine.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.id)
        self.postLine.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        self.postLine.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
        self.postLine.tableHeaderView = ProfileHeaderView()
    }
}
extension ProfileViewController:  UITableViewDelegate, UITableViewDataSource{
    
    private func addAllSubviews(){
        self.view.addSubview(postLine)
    }
    
    private func setupAllViews(_ safeLayout: UILayoutGuide){
        NSLayoutConstraint.activate([
            postLine.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            postLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            postLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            postLine.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return arrayOfPhoto.count
        } else{
            return arrayOfPost.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = postLine.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifire, for: indexPath) as! PhotosTableViewCell
            let photoList = arrayOfPhoto[indexPath.row]
            cell.contentOfPost.image = UIImage(named: photoList)
            return cell
            
        } else {
            
            let cell = postLine.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as! PostTableViewCell
            let postList = arrayOfPost[indexPath.row]
            cell.authorOfPost.text = postList.author
            cell.contentOfPost.image = UIImage(named: postList.imageOfPost)
            cell.descriptionOfPost.text = postList.descriptionOfPost
            cell.likesOfPost.text = "Likes: \(postList.likes)"
            cell.viewsOfPost.text = "Views: \(postList.views)"
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postLine.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        postLine.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
    
}
