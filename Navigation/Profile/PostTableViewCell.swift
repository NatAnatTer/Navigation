//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Наталья Терзьян on 16.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifire  = "PostTableViewCell"
    
//    let stackView:UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution = .equalCentering
//        stackView.alignment = .center
//        stackView.spacing = 0
//        stackView.layer.cornerRadius = 10
//        stackView.layer.borderWidth = 0.5
//        stackView.layer.borderColor = UIColor.lightGray.cgColor
//        stackView.backgroundColor = .systemGray6
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    let authorOfPost: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.numberOfLines = 2
        return view
    }()
    
    let contentOfPost: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let descriptionOfPost: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .systemGray
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.numberOfLines = 0
        return view
    }()
    
    let likesOfPost: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return view
    }()
    
    let viewsOfPost: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return view
    }()
    
    
    override   init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addAllSubview()
        setupAllView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension PostTableViewCell{
    private func addAllSubview(){
//        self.contentView.addSubview(stackView)
//        stackView.addArrangedSubview(authorOfPost)
//        stackView.addArrangedSubview(contentOfPost)
//        stackView.addArrangedSubview(descriptionOfPost)
//        stackView.addArrangedSubview(likesOfPost)
//        stackView.addArrangedSubview(viewsOfPost)
        self.contentView.addSubview(authorOfPost)
        self.contentView.addSubview(contentOfPost)
        self.contentView.addSubview(descriptionOfPost)
        self.contentView.addSubview(likesOfPost)
        self.contentView.addSubview(viewsOfPost)
        
    }
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            
//            authorOfPost.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 16),
//            authorOfPost.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 16),
//            authorOfPost.bottomAnchor.constraint(equalTo: self.contentOfPost.topAnchor),
//
//            self.contentOfPost.topAnchor.constraint(equalTo: self.authorOfPost.bottomAnchor, constant: 12),
//            self.contentOfPost.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
//            self.contentOfPost.bottomAnchor.constraint(equalTo: self.descriptionOfPost.topAnchor),
//
//            self.descriptionOfPost.topAnchor.constraint(equalTo: contentOfPost.bottomAnchor, constant: 16),
//            self.descriptionOfPost.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 16),
//            self.contentOfPost.widthAnchor.constraint(equalToConstant: 300),
//            self.contentOfPost.heightAnchor.constraint(equalToConstant: 300),
//            self.descriptionOfPost.bottomAnchor.constraint(equalTo: self.likesOfPost.topAnchor),
//
//
//            self.likesOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
//            self.likesOfPost.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 16),
//            self.likesOfPost.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -16),
//
//            self.viewsOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
//            self.viewsOfPost.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -16),
//            self.viewsOfPost.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -16)
////
            
            
            
            
            
            self.authorOfPost.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.authorOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.authorOfPost.bottomAnchor.constraint(equalTo: self.contentOfPost.topAnchor, constant:  -12),

            self.contentOfPost.topAnchor.constraint(equalTo: self.authorOfPost.bottomAnchor, constant: 12),
            self.contentOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.contentOfPost.widthAnchor.constraint(equalToConstant: 300),
                     self.contentOfPost.heightAnchor.constraint(equalToConstant: 300),
            self.contentOfPost.bottomAnchor.constraint(equalTo: self.descriptionOfPost.topAnchor),

            self.descriptionOfPost.topAnchor.constraint(equalTo: contentOfPost.bottomAnchor, constant: 16),
            self.descriptionOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionOfPost.bottomAnchor.constraint(equalTo: self.likesOfPost.topAnchor),


            self.likesOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            self.likesOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.likesOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),

            self.viewsOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            self.viewsOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.viewsOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
            
            
            
            //            self.authorOfPost.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            //            self.authorOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            //            self.authorOfPost.heightAnchor.constraint(equalToConstant: 200),
            //           // self.authorOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            //
            //           // self.authorOfPost.bottomAnchor.constraint(equalTo: self.contentOfPost.topAnchor),
            //            self.authorOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            
            
            
            
            
            //            self.contentOfPost.topAnchor.constraint(equalTo: self.authorOfPost.bottomAnchor, constant: 12),
            //            self.contentOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            //            self.contentOfPost.widthAnchor.constraint(equalToConstant: 300),
            //            self.contentOfPost.heightAnchor.constraint(equalToConstant: 300),
            //          //  self.contentOfPost.widthAnchor.constraint(equalTo: self.screen.bounds.width),
            //          //  self.contentOfPost.heightAnchor.constraint(equalTo: self.screen.bounds.width),
            //            self.contentOfPost.bottomAnchor.constraint(equalTo: self.descriptionOfPost.topAnchor),
            //
            //            self.descriptionOfPost.topAnchor.constraint(equalTo: contentOfPost.bottomAnchor, constant: 16),
            //            self.descriptionOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            //            self.descriptionOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            //            self.descriptionOfPost.bottomAnchor.constraint(equalTo: self.likesOfPost.topAnchor),
            //
            //            self.likesOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            //            self.likesOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            //            self.likesOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            //
            //            self.viewsOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            //            self.viewsOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            //            self.viewsOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
            
        ])
    }
}
