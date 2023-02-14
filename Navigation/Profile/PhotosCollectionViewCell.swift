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
    
//    let blackView: UIView = {
//        let view = UIView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .black
//        view.isOpaque = false
//        view.alpha = 0.0
//        return view
//    }()
//

    
//    let closeButtonView:UIButton = {
//        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
//        view.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
//        view.tintColor = .white
//        view.layer.opacity = 0.0
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.contentView.addSubview(self.blackView)
//        self.contentView.addSubview(self.closeButtonView)
        contentView.addSubview(photosInCollection)
        
        NSLayoutConstraint.activate([
            photosInCollection.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            photosInCollection.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            photosInCollection.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            photosInCollection.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
//
//            blackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            blackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            blackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
//            closeButtonView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
//            closeButtonView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
        ])
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(photoTapped(tapGestureRecognizer:)))
//        self.photosInCollection.isUserInteractionEnabled = true
//        self.photosInCollection.addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc private func photoTapped(tapGestureRecognizer: UITapGestureRecognizer){
//
//        UIImageView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut){
//            self.blackView.alpha = 0.7
//
//            self.photosInCollection.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
//            self.photosInCollection.center = CGPoint(x: self.blackView.center.x, y: self.blackView.center.y - 55)
//
//            self.photosInCollection.layer.cornerRadius = 0
//            self.photosInCollection.layer.borderWidth = 0
//
//            self.layoutIfNeeded()
//        } completion:{ _ in
//            UIImageView.animate(withDuration: 0.3, delay: 0){
//                self.closeButtonView.layer.opacity = 1
//            }
//
//        }
        
   // }
}
