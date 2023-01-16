//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Наталья Терзьян on 16.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
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
    
    
//    let postLine: UITableView = {
//        let view = UITableView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        return view
//    }()
    
//    let loginPasswordView: UITableView = {
//            let view = UITableView(frame: .zero)
//            view.translatesAutoresizingMaskIntoConstraints = false
//            view.backgroundColor = .systemGray6
//             view.layer.cornerRadius = 10
//             view.layer.borderWidth = 0.5
//             view.layer.borderColor = UIColor.lightGray.cgColor
//            return view
//        }()
    
    init(frame: CGRect) {
        
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
    }
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            self.authorOfPost.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.authorOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.authorOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            self.contentOfPost.topAnchor.constraint(equalTo: self.authorOfPost.bottomAnchor, constant: 12),
            self.contentOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
          //  self.contentOfPost.widthAnchor.constraint(equalTo: self.screen.bounds.width),
          //  self.contentOfPost.heightAnchor.constraint(equalTo: self.screen.bounds.width),
    
            self.descriptionOfPost.topAnchor.constraint(equalTo: contentOfPost.bottomAnchor, constant: 16),
            self.descriptionOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            self.likesOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            self.likesOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.likesOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            
            self.viewsOfPost.topAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 16),
            self.viewsOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.viewsOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
                                          
            ])
    }
}
