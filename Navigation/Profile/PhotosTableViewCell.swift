//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Наталья Терзьян on 20.01.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifire  = "PhotosTableViewCell"
    var rowWithPhotos: String = ""
    
    
    var  photoCollectionView: UICollectionView!
    var nameOfCell: UILabel!
    var arrowToDetail: UIImageView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.nameOfCell = UILabel(frame: .zero)
        self.nameOfCell.textColor = .black
        self.nameOfCell.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        self.nameOfCell.translatesAutoresizingMaskIntoConstraints = false
        self.nameOfCell.text = "Photos"
        
        self.arrowToDetail = UIImageView(frame: .zero)
        //        self.arrowToDetail = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        
        self.arrowToDetail.translatesAutoresizingMaskIntoConstraints = false
        self.arrowToDetail.image = UIImage(systemName: "arrow.forward")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        //   flowLayout.itemSize = CGSize(width: 150, height: 180)
        // flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 8.0
        flowLayout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 0)
        // flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 40)/4, height: (UIScreen.main.bounds.width - 40)/4)
        photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        //   self.photoCollectionView.collectionViewLayout = flowLayout
        self.photoCollectionView.showsHorizontalScrollIndicator = false
        self.photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.photoCollectionView.delegate = self
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.register(PhotoProfileCollectionViewCell.self, forCellWithReuseIdentifier: PhotoProfileCollectionViewCell.identifire)
        
        
        addAllSubview()
        setupAllView()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 6
    }
    
}

extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPhoto.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoProfileCollectionViewCell.identifire, for: indexPath) as! PhotoProfileCollectionViewCell
        let photoList = arrayOfPhoto[indexPath.row]
        cell.currentPhoto.image = UIImage(named: photoList)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 40)/4, height: (UIScreen.main.bounds.width - 40)/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 0)
    }
    
    
    private func addAllSubview(){
        self.contentView.addSubview(photoCollectionView)
        self.contentView.addSubview(nameOfCell)
        self.contentView.addSubview(arrowToDetail)
        
    }
    
    private func setupAllView(){
        NSLayoutConstraint.activate([
            
            self.nameOfCell.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.nameOfCell.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.nameOfCell.bottomAnchor.constraint(equalTo: self.photoCollectionView.topAnchor, constant: -12),
            self.nameOfCell.heightAnchor.constraint(equalToConstant: 20),
            
            self.arrowToDetail.centerYAnchor.constraint(equalTo: self.nameOfCell.centerYAnchor),
            self.arrowToDetail.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.arrowToDetail.heightAnchor.constraint(equalToConstant: 20),
            self.arrowToDetail.widthAnchor.constraint(equalToConstant: 20),
            
            
            self.photoCollectionView.topAnchor.constraint(equalTo: self.nameOfCell.bottomAnchor),
            self.photoCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            self.photoCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.photoCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            self.photoCollectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 40)/4),
        ])
    }
}



