//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate{
    
    var arrayOfPost:[Post] = [postOne, postTwo, postThree, postFour]
    
    let gestRecognizer = UIGestureRecognizer()
    
    let postLine: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    let headerView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.navigationItem.title = "Профиль"
        let safeLayout = self.view.safeAreaLayoutGuide
        gestRecognizer.delegate = self
        addAllSubviews()
        setupAllViews(safeLayout)
        createTable()
        
    }
    private func createTable(){
        self.postLine.delegate = self
        self.postLine.dataSource = self
        self.postLine.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        self.postLine.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
        self.postLine.tableHeaderView = headerView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.isNavigationBarHidden = true
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
            return 1
        } else{
            return arrayOfPost.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
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
            
            
            let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(labelTap(tapGesture:)))
            tapGesture.delegate = self
            tapGesture.numberOfTapsRequired = 1
            cell.likesOfPost.isUserInteractionEnabled = true
            cell.likesOfPost.tag = indexPath.row
            cell.likesOfPost.addGestureRecognizer(tapGesture)
            
            let tapPhoto : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(PhotoTap(tapGesture:)))
            tapPhoto.delegate = self
            tapPhoto.numberOfTapsRequired = 1
            cell.contentOfPost.isUserInteractionEnabled = true
            cell.contentOfPost.tag = indexPath.row
            cell.contentOfPost.addGestureRecognizer(tapPhoto)
            
            return cell
        }
    }
    
    @objc func labelTap(tapGesture:UITapGestureRecognizer){
        let countLikes = arrayOfPost[tapGesture.view!.tag].likes
        arrayOfPost[tapGesture.view!.tag].likes = countLikes + 1
        self.postLine.reloadData()
       // print("Label tag is:\(tapGesture.view!.tag)")
    }
    @objc func PhotoTap(tapGesture:UITapGestureRecognizer){
      
       
        let countOfViews = arrayOfPost[tapGesture.view!.tag].likes
        arrayOfPost[tapGesture.view!.tag].views = countOfViews + 1
        self.postLine.reloadData()
       // print("Label tag is:\(tapGesture.view!.tag)")
    }
    
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postLine.deselectRow(at: indexPath, animated: true)
       
    }
 
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let vc = PhotosViewController()
        if  indexPath.section == 0{
            self.navigationController?.pushViewController(vc, animated: true)
        } else{
          
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        postLine.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id)
    }
  
}
