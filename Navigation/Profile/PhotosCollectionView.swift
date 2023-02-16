//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 23.01.2023.
//

import UIKit

class PhotosCollectionView: UICollectionView {
    
 
    
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/3, height: (UIScreen.main.bounds.width - 32)/3)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        super .init(frame: .zero, collectionViewLayout: layout)
        register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        isPagingEnabled = true
        dataSource = self
  
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PhotosCollectionView: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as! PhotosCollectionViewCell
        let currentPhoto = arrayOfPhoto[indexPath.item]
        cell.photosInCollection.image = UIImage(named: currentPhoto)
        
//        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(photoInCollectionTap(tapGesture:)))
//        tapGesture.delegate = self
//        tapGesture.numberOfTapsRequired = 1
//        cell.photosInCollection.isUserInteractionEnabled = true
//        cell.photosInCollection.tag = indexPath.row
//        cell.photosInCollection.addGestureRecognizer(tapGesture)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Выбрана ячейка \(indexPath.item)")
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, animations: ({
            cell?.frame = collectionView.bounds
            
        }), completion: nil)
    }
    
    
    
//    @objc func photoInCollectionTap(tapGesture:UITapGestureRecognizer){
//        PhotosViewController().animatePhotoTap(index: tapGesture.view!.tag)
//
//        self.layoutIfNeeded()
       
 //   }
    

    
}
