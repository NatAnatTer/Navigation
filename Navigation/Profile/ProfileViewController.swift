//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    
    let arrayOfPost:[Post] = [postOne, postTwo, postThree, postFour]
   
    
    let postLine: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
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
        self.postLine.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        self.postLine.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
    
        let headerView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        self.postLine.tableHeaderView = headerView
        
       // self.postLine.contentSize = CGSizeMake(self.postLine.frame.size.width, self.postLine.contentSize.height)
        
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
            return 1 //arrayOfPhoto.count
        } else{
            return arrayOfPost.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let transform: CGAffineTransform = CGAffineTransformMakeRotation(3.1432/2)
//                cell.transform = transform
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = postLine.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifire, for: indexPath) as! PhotosTableViewCell
            
            cell.selectionStyle = .none
            
            cell.nameOfCell.text = "Photos"
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
    
    
//    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
//        if section == 0{
//            postLine.dequeueReusableHeaderFooterView(withIdentifier: <#T##String#>)
//        }
//    }
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
