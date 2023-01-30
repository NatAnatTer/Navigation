//
//  PhotoProfileCollectionViewCell.swift
//  Navigation
//
//  Created by Наталья Терзьян on 26.01.2023.
//

import UIKit

class PhotoProfileCollectionViewCell: UICollectionViewCell {
    
    static let identifire  = "PhotoProfileCollectionViewCell"
    
    let currentPhoto: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    
    override   init(frame: CGRect) {
        super .init(frame: frame)
        
        addAllSubview()
        setupAllView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        //      (self.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/3, height: 100)
    }
    
}
extension PhotoProfileCollectionViewCell{
    private func addAllSubview(){
        self.contentView.addSubview(currentPhoto)
        
    }
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            self.currentPhoto.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.currentPhoto.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.currentPhoto.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.currentPhoto.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            
        ])
    }
}
