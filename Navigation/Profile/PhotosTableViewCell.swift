//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Наталья Терзьян on 20.01.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    static let identifire  = "PhotosTableViewCell"
 
    let contentOfPost: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addAllSubview()
        setupAllView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension PhotosTableViewCell{
    private func addAllSubview(){
        self.contentView.addSubview(contentOfPost)
        
    }
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            self.contentOfPost.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.contentOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.contentOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.contentOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12)
            
        ])
    }
}
