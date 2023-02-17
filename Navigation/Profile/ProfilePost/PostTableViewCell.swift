//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Наталья Терзьян on 16.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifire  = "PostTableViewCell"
    
    
    
    let authorOfPost: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: CGFloat(getSizesOfElements(sizeEnum: .fontSize20)), weight: .bold)
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
        view.font = UIFont.systemFont(ofSize: CGFloat(getSizesOfElements(sizeEnum: .fontSize14)), weight: .regular)
        view.numberOfLines = 1
        return view
    }()
    
    let likesOfPost: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: CGFloat(getSizesOfElements(sizeEnum: .fontSize16)), weight: .regular)
        return view
    }()
    
    let viewsOfPost: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: CGFloat(getSizesOfElements(sizeEnum: .fontSize16)), weight: .regular)
        return view
    }()
    
    
    override   init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addAllSubview()
        setupAllView()
        //    pressButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension PostTableViewCell{
    private func addAllSubview(){
        self.contentView.addSubview(authorOfPost)
        self.contentView.addSubview(contentOfPost)
        self.contentView.addSubview(descriptionOfPost)
        self.contentView.addSubview(likesOfPost)
        self.contentView.addSubview(viewsOfPost)
        
    }
    
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            
            self.authorOfPost.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.authorOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.authorOfPost.bottomAnchor.constraint(equalTo: self.contentOfPost.topAnchor, constant:  -12),
            self.authorOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            self.contentOfPost.topAnchor.constraint(equalTo: self.authorOfPost.bottomAnchor, constant: 12),
            self.contentOfPost.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.contentOfPost.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.contentOfPost.bottomAnchor.constraint(equalTo: self.descriptionOfPost.topAnchor, constant: -16),
            
            self.descriptionOfPost.topAnchor.constraint(equalTo: contentOfPost.bottomAnchor, constant: 16),
            self.descriptionOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionOfPost.bottomAnchor.constraint(equalTo: self.likesOfPost.topAnchor, constant: -16),
            self.descriptionOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            
            self.likesOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            self.likesOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.likesOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            
            self.viewsOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            self.viewsOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.viewsOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            self.descriptionOfPost.topAnchor.constraint(equalTo: contentOfPost.bottomAnchor, constant: 16),
        ])
    }
}
