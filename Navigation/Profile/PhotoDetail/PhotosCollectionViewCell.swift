//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Наталья Терзьян on 23.01.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell  {
    
    static let identifire = "PhotosCollectionViewCell"
    
    let photosInCollection: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photosInCollection)
        
        NSLayoutConstraint.activate([
            photosInCollection.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            photosInCollection.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            photosInCollection.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            photosInCollection.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
