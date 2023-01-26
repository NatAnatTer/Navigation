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
       // view.layer.cornerRadius = 6
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photosInCollection)
        
        NSLayoutConstraint.activate([
            photosInCollection.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photosInCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            photosInCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            photosInCollection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            self.layer.cornerRadius = 10
    }
    
}
