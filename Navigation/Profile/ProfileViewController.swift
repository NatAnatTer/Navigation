//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 08.12.2022.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate{
    
    let arrayOfPost:[Post] = [postOne, postTwo, postThree, postFour]
    
    
    let postLine: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isOpaque = false
        view.alpha = 0.5
        return view
    }()
    var closeButtonView:UIButton = {
        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        view.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        view.tintColor = .clear//.white
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    var isBig = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
    }
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.navigationItem.title = "Профиль"
        let safeLayout = self.view.safeAreaLayoutGuide
        
        self.backgroundView.isHidden = true
        addAllSubviews()
        setupAllViews(safeLayout)
        createTable()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileIconTapped(tapGestureRecognizer:)))
        headerView.profileIconView.isUserInteractionEnabled = true
        headerView.profileIconView.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    @objc private func profileIconTapped(tapGestureRecognizer: UITapGestureRecognizer){
        
        self.closeButtonView.addTarget(self, action: #selector(pressCloseAvatar), for: .touchUpInside)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn]){ //delay сколько нужно подождать прежде чем выводиться
            self.view.addSubview(self.backgroundView)
            self.backgroundView.isHidden = false
            self.backgroundView.backgroundColor = .black
            let safeLayout = self.view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                self.backgroundView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
                self.backgroundView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
                self.backgroundView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
                self.backgroundView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
                
            ])
        }
        UIView.animate(withDuration: 0.7, delay: 0, options: [.curveEaseIn]){ //delay сколько нужно подождать прежде чем выводиться
            
            self.backgroundView.addSubview(self.closeButtonView)
            self.closeButtonView.isHidden = false
            self.closeButtonView.tintColor = .white
            NSLayoutConstraint.activate([
                self.closeButtonView.topAnchor.constraint(equalTo: self.backgroundView.topAnchor, constant: 8),
                self.closeButtonView.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor, constant: -8)
            ])
        }
    }
    
    
    @objc private func pressCloseAvatar(){
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn]){
            self.backgroundView.isHidden = true
            self.backgroundView.backgroundColor = .clear
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn]){
            self.closeButtonView.isHidden = true
            self.closeButtonView.tintColor = .clear
        }
        
    }
    
    
    private func createTable(){
        self.postLine.delegate = self
        self.postLine.dataSource = self
        self.postLine.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        self.postLine.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
        
        //    let headerView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        self.postLine.tableHeaderView = headerView
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //
        //        self.closeButtonView.addTarget(self, action: #selector(pressCloseAvatar), for: .touchUpInside)
        //
        //        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn]){ //delay сколько нужно подождать прежде чем выводиться
        //            self.view.addSubview(self.backgroundView)
        //            self.backgroundView.isHidden = false
        //            self.backgroundView.backgroundColor = .black
        //            let safeLayout = self.view.safeAreaLayoutGuide
        //
        //            NSLayoutConstraint.activate([
        //                self.backgroundView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
        //                self.backgroundView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
        //                self.backgroundView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
        //                self.backgroundView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
        //
        //            ])
        //        }
        //        UIView.animate(withDuration: 0.7, delay: 0, options: [.curveEaseIn]){ //delay сколько нужно подождать прежде чем выводиться
        //
        //            self.backgroundView.addSubview(self.closeButtonView)
        //           self.closeButtonView.isHidden = false
        //            self.closeButtonView.tintColor = .white
        //            NSLayoutConstraint.activate([
        //                self.closeButtonView.topAnchor.constraint(equalTo: self.backgroundView.topAnchor, constant: 8),
        //                self.closeButtonView.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor, constant: -8)
        //            ])
    }
    
    @objc private func pressIcon(){
        
        self.closeButtonView.addTarget(self, action: #selector(pressCloseAvatar), for: .touchUpInside)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn]){ //delay сколько нужно подождать прежде чем выводиться
            self.view.addSubview(self.backgroundView)
            self.backgroundView.isHidden = false
            self.backgroundView.backgroundColor = .black
            let safeLayout = self.view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                self.backgroundView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
                self.backgroundView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
                self.backgroundView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
                self.backgroundView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
                
            ])
        }
        UIView.animate(withDuration: 0.3, delay: 0.5, options: [.curveEaseIn]){ //delay сколько нужно подождать прежде чем выводиться
            
            self.backgroundView.addSubview(self.closeButtonView)
            self.closeButtonView.isHidden = false
            self.closeButtonView.tintColor = .white
            NSLayoutConstraint.activate([
                self.closeButtonView.topAnchor.constraint(equalTo: self.backgroundView.topAnchor, constant: 8),
                self.closeButtonView.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor, constant: -8)
            ])
        }
        
        if isBig{
            self.headerView.profileIconView.widthAnchor.constraint(equalToConstant: 100)
            self.headerView.profileIconView.heightAnchor.constraint(equalToConstant: 100)
        } else{
            self.headerView.profileIconView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            self.headerView.profileIconView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width) 
        }
        isBig.toggle()
        
        
        UIImageView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn]){ //for avatar
            self.backgroundView.addSubview(self.headerView.profileIconView)
            self.headerView.profileIconView.layoutIfNeeded()
           // self.backgroundView.addSubview(self.headerView.profileIconView)
            //  self.headerView.profileIconView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
     //       self.headerView.profileIconView.center.x = self.view.center.x
            
            //  self.headerView.profileIconView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            //  self.headerView.profileIconView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            
        }
    }
    
    
}
extension ProfileViewController:  UITableViewDelegate, UITableViewDataSource{
    
    private func addAllSubviews(){
        self.view.addSubview(postLine)
        //  self.view.addSubview(backgroundView)
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
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postLine.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let vc = PhotosViewController()
        if  indexPath.row == 0{
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        postLine.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id)
    }
}
