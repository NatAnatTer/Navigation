//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 23.01.2023.
//

import UIKit

class PhotosViewController: UICollectionView {

    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
 
        super .init(frame: .zero, collectionViewLayout: layout)
       
        
        register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        
        contentInset = UIEdgeInsets(top: 16, left: 8, bottom: 8, right: 8)
        isPagingEnabled = true
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        (self.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/3, height: 100)
    }

}


extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as! PhotosCollectionViewCell
        let currentPhoto = arrayOfPhoto[indexPath.item]
        cell.photosInCollection.image = UIImage(named: currentPhoto)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = arrayOfPhoto.remove(at: sourceIndexPath.item)
        arrayOfPhoto.insert(item, at: destinationIndexPath.item)
    }
    
    
}


//let postLine: UICollectionView = {
//        let view = UICollectionView(frame: .zero, style: .plain)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        return view
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//
//    }
//
//    private func setupView() {
//        self.view.backgroundColor = .systemGray6
//        self.navigationItem.title = "Профиль"
//        let safeLayout = self.view.safeAreaLayoutGuide
////        addAllSubviews()
////        setupAllViews(safeLayout)
////        createTable()
//    }
//
