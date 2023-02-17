//
//  PhotosViewControllers.swift
//  Navigation
//
//  Created by Наталья Терзьян on 24.01.2023.
//


import UIKit

class PhotosViewController: UIViewController {
    
    // let photoView = PhotosCollectionView()
    
    var  photoView: UICollectionView!
    
    let collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/3, height: (UIScreen.main.bounds.width - 32)/3)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        return layout
    }()
    
    let blackView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isOpaque = false
        view.alpha = 0.0
        return view
    }()
    let photosInAnimation: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.isOpaque = false
        view.alpha = 0.0
        view.clipsToBounds = true
        return view
    }()
    let closeButtonView:UIButton = {
        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        view.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        view.tintColor = .white
        view.layer.opacity = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.navigationItem.title = "Photo Gallery"
        
        self.photoView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        self.photoView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        self.photoView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        self.photoView.isPagingEnabled = true
        self.photoView.dataSource = self
        
        setupSubviews()
        
        self.closeButtonView.addTarget(self, action: #selector(pressClosePhoto), for: .touchUpInside)
    }
    
    @objc private func pressClosePhoto(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [.curveEaseOut]){
            self.closeButtonView.alpha = 0.0
        } completion: { _ in
            self.blackView.alpha = 0.0
            self.photosInAnimation.isOpaque = false
            self.photosInAnimation.alpha = 0.0
            self.photosInAnimation.layoutIfNeeded()
        }
        
    }
    
    private func setupSubviews(){
        
        
        self.view.addSubview(self.photoView)
        self.view.addSubview(self.blackView)
        self.view.addSubview(self.closeButtonView)
        self.view.addSubview(self.photosInAnimation)
        
        let safeLayout = self.view.safeAreaLayoutGuide
        self.photoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
            photoView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 8),
            photoView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 8),
            photoView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -8),
            
            self.blackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            self.blackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
            self.blackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
            self.blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            self.closeButtonView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
            self.closeButtonView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -8),
            
            self.photosInAnimation.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.photosInAnimation.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.photosInAnimation.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor),
            self.photosInAnimation.centerYAnchor.constraint(equalTo: safeLayout.centerYAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.photoView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
//        print("Выбрана ячейка \(indexPath.item)")
//        let cell = collectionView.cellForItem(at: indexPath)
//
//        UIView.animate(withDuration: 0.5, delay: 0.3, animations: ({
//            cell?.frame = collectionView.bounds
//
//        }), completion: nil)
//    }
//
//
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as! PhotosCollectionViewCell
        let currentPhoto = arrayOfPhoto[indexPath.item]
        cell.photosInCollection.image = UIImage(named: currentPhoto)
        
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(photoInCollectionTap(tapGesture:)))
        tapGesture.delegate = self
        tapGesture.numberOfTapsRequired = 1
        cell.photosInCollection.isUserInteractionEnabled = true
        cell.photosInCollection.tag = indexPath.row
        cell.photosInCollection.addGestureRecognizer(tapGesture)
        
        return cell
    }
    @objc func photoInCollectionTap(tapGesture:UITapGestureRecognizer){
        print("print gesture \(String(describing: tapGesture.view?.tag))")
        UIImageView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut){
            self.blackView.alpha = 0.7
            
            //      UIImageView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut){
            //             self.blackView.alpha = 0.7
            //     self.blackView.isOpaque = true
            //            self.view.addSubview(self.blackView)
            //            let safeLayout = self.view.safeAreaLayoutGuide
            
            //            self.blackView.layoutIfNeeded()
            let index = tapGesture.view?.tag ?? 0
            let namePhoto = arrayOfPhoto[index]
            //                      self.photosInAnimation.image = UIImage(named: namePhoto)
            //                             self.photosInAnimation.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.photosInAnimation.image = UIImage(named: namePhoto)
          //  self.photosInAnimation.layer.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
         //   self.photosInAnimation.center = CGPoint(x: self.blackView.center.x, y: self.blackView.center.y - 55)
            self.photosInAnimation.isOpaque = true
            self.photosInAnimation.alpha = 1.0
            
           
        } completion:{ _ in
            UIImageView.animate(withDuration: 0.3, delay: 0){
                self.closeButtonView.layer.opacity = 1
            }
            
        }
        //
    }
}




//--------------------------------------------------


//
//import UIKit
//
//class PhotosViewController: UIViewController {
//
//    let photoView = PhotosCollectionView()
//
////    let blackView: UIView = {
////        let view = UIView(frame: .zero)
////        view.translatesAutoresizingMaskIntoConstraints = false
////        view.backgroundColor = .black
////       // view.isOpaque = false
////        view.alpha = 0.0
////        return view
////    }()
//
////    let photosInAnimation: UIImageView = {
////        let view = UIImageView(frame: .zero)
////        view.backgroundColor = .black
////        view.translatesAutoresizingMaskIntoConstraints = false
////        view.contentMode = .scaleAspectFit
////        view.isOpaque = false
////        view.clipsToBounds = true
////        return view
////    }()
////    let closeButtonView:UIButton = {
////        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
////        view.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
////        view.tintColor = .white
////        view.layer.opacity = 0.0
////        view.translatesAutoresizingMaskIntoConstraints = false
////        return view
////    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemGray6
//        self.navigationItem.title = "Photo Gallery"
//        photoView.translatesAutoresizingMaskIntoConstraints = false
////        self.view.addSubview(photoView)
////           self.view.addSubview(self.blackView)
////           self.view.addSubview(self.closeButtonView)
////        self.view.addSubview(self.photosInAnimation)
////        let safeLayout = self.view.safeAreaLayoutGuide
////
////        NSLayoutConstraint.activate([
////            photoView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
////            photoView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 8),
////            photoView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 8),
////            photoView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -8),
////                        blackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
////                        blackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
////                        blackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
////                        blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
////                        closeButtonView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
////                        closeButtonView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -8),
////        ])
//        setupSubviews()
//    }
//
//    private func setupSubviews(){
//
//    //       self.view.addSubview(self.blackView)
// //          self.view.addSubview(self.closeButtonView)
//   //     self.view.addSubview(self.photosInAnimation)
//        self.view.addSubview(photoView)
//
//        let safeLayout = self.view.safeAreaLayoutGuide
//
//        NSLayoutConstraint.activate([
//            photoView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
//            photoView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 8),
//            photoView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 8),
//            photoView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -8),
////                        blackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
////                        blackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
////                        blackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
////                        blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
////                        closeButtonView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
////                        closeButtonView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -8),
//        ])
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//        self.navigationController?.isNavigationBarHidden = false
//    }
//
//
//
////    func animatePhotoTap(index: Int){
////
////        UIImageView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut){
////                   self.blackView.alpha = 0.7
////            self.blackView.isOpaque = true
//////            self.view.addSubview(self.blackView)
//////            let safeLayout = self.view.safeAreaLayoutGuide
//////            NSLayoutConstraint.activate([
//////                self.blackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
//////                self.blackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
//////                self.blackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
//////                self.blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
//////            ])
//////            self.blackView.layoutIfNeeded()
////            let namePhoto = arrayOfPhoto[index]
////            self.photosInAnimation.image = UIImage(named: namePhoto)
////                   self.photosInAnimation.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
////                   self.photosInAnimation.center = CGPoint(x: self.blackView.center.x, y: self.blackView.center.y - 55)
////            self.photosInAnimation.isOpaque = true
////
////            let currentPhoto = arrayOfPhoto[index]
////            self.photosInAnimation.image = UIImage(named: currentPhoto)
//////                   self.photosInAnimation.layer.cornerRadius = 0
//////                   self.photosInAnimation.layer.borderWidth = 0
////     //       self.closeButtonView.layoutIfNeeded()
////       //     self.blackView.layoutIfNeeded()
////                //   self.layoutIfNeeded()
////          //  self.setupSubviews()
////               } completion:{ _ in
////                   UIImageView.animate(withDuration: 0.3, delay: 0){
////                       self.closeButtonView.layer.opacity = 1
////                   }
////
////               }
////
////    }
//}
//
//extension PhotosViewController: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Выбрана ячейка \(indexPath.item)")
//        let cell = collectionView.cellForItem(at: indexPath)
//
//        UIView.animate(withDuration: 0.5, delay: 0.3, animations: ({
//            cell?.frame = collectionView.bounds
//
//        }), completion: nil)
//    }
//}

//____________________________________________





//import UIKit
//
//class PhotosViewController: UIViewController {
//
//  //  let photoView = PhotosCollectionView()
//
//    let photoView: UICollectionView = {
//        let layout = UICollectionView()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 8
//        layout.minimumInteritemSpacing = 8
//        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/3, height: (UIScreen.main.bounds.width - 32)/3)
//        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
//        return layout
//    }()
//
//
//
////    let blackView: UIView = {
////        let view = UIView(frame: .zero)
////        view.translatesAutoresizingMaskIntoConstraints = false
////        view.backgroundColor = .black
////       // view.isOpaque = false
////        view.alpha = 0.0
////        return view
////    }()
//
////    let photosInAnimation: UIImageView = {
////        let view = UIImageView(frame: .zero)
////        view.backgroundColor = .black
////        view.translatesAutoresizingMaskIntoConstraints = false
////        view.contentMode = .scaleAspectFit
////        view.isOpaque = false
////        view.clipsToBounds = true
////        return view
////    }()
////    let closeButtonView:UIButton = {
////        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
////        view.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
////        view.tintColor = .white
////        view.layer.opacity = 0.0
////        view.translatesAutoresizingMaskIntoConstraints = false
////        return view
////    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemGray6
//        self.navigationItem.title = "Photo Gallery"
//        photoView.translatesAutoresizingMaskIntoConstraints = false
//        setUpCollectionView()
//
//
//        setupSubviews()
//    }
//
//    func setUpCollectionView(){
//
//        layout.register(PhotosCollectionViewCell.self, forDecorationViewOfKind: PhotosCollectionViewCell.identifire)
//        layout.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        layout.isPagingEnabled = true
//        layout.dataSource = self
//
//    }
//
//    private func setupSubviews(){
//
//    //       self.view.addSubview(self.blackView)
// //          self.view.addSubview(self.closeButtonView)
//   //     self.view.addSubview(self.photosInAnimation)
//        self.view.addSubview(photoView)
//
//        let safeLayout = self.view.safeAreaLayoutGuide
//
//        NSLayoutConstraint.activate([
//            photoView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
//            photoView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 8),
//            photoView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 8),
//            photoView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -8),
////                        blackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
////                        blackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
////                        blackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
////                        blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
////                        closeButtonView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
////                        closeButtonView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -8),
//        ])
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//        self.navigationController?.isNavigationBarHidden = false
//    }
//
//
//}
//
//extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        arrayOfPhoto.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as! PhotosCollectionViewCell
//        let currentPhoto = arrayOfPhoto[indexPath.item]
//        cell.photosInCollection.image = UIImage(named: currentPhoto)
//        return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Выбрана ячейка \(indexPath.item)")
//        let cell = collectionView.cellForItem(at: indexPath)
//
//        UIView.animate(withDuration: 0.5, delay: 0.3, animations: ({
//            cell?.frame = collectionView.bounds
//
//        }), completion: nil)
//    }
//}
//


