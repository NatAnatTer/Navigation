//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Наталья Терзьян on 23.01.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "PhotosCollectionViewCell"
    
    let photosInCollection: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
}
