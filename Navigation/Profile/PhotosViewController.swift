//
//  PhotosViewControllers.swift
//  Navigation
//
//  Created by Наталья Терзьян on 24.01.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photoView = PhotosCollectionView()
    
//    let blackView: UIView = {
//        let view = UIView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .black
//       // view.isOpaque = false
//        view.alpha = 0.0
//        return view
//    }()
    
//    let photosInAnimation: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.backgroundColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.contentMode = .scaleAspectFit
//        view.isOpaque = false
//        view.clipsToBounds = true
//        return view
//    }()
//    let closeButtonView:UIButton = {
//        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
//        view.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
//        view.tintColor = .white
//        view.layer.opacity = 0.0
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.navigationItem.title = "Photo Gallery"
        photoView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(photoView)
//           self.view.addSubview(self.blackView)
//           self.view.addSubview(self.closeButtonView)
//        self.view.addSubview(self.photosInAnimation)
//        let safeLayout = self.view.safeAreaLayoutGuide
//
//        NSLayoutConstraint.activate([
//            photoView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
//            photoView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 8),
//            photoView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 8),
//            photoView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -8),
//                        blackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
//                        blackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
//                        blackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
//                        blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
//                        closeButtonView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
//                        closeButtonView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -8),
//        ])
        setupSubviews()
    }
    
    private func setupSubviews(){
       
    //       self.view.addSubview(self.blackView)
 //          self.view.addSubview(self.closeButtonView)
   //     self.view.addSubview(self.photosInAnimation)
        self.view.addSubview(photoView)
        
        let safeLayout = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
            photoView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 8),
            photoView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 8),
            photoView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -8),
//                        blackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
//                        blackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
//                        blackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
//                        blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
//                        closeButtonView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
//                        closeButtonView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -8),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
  
    
//    func animatePhotoTap(index: Int){
//
//        UIImageView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut){
//                   self.blackView.alpha = 0.7
//            self.blackView.isOpaque = true
////            self.view.addSubview(self.blackView)
////            let safeLayout = self.view.safeAreaLayoutGuide
////            NSLayoutConstraint.activate([
////                self.blackView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
////                self.blackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor),
////                self.blackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor),
////                self.blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
////            ])
////            self.blackView.layoutIfNeeded()
//            let namePhoto = arrayOfPhoto[index]
//            self.photosInAnimation.image = UIImage(named: namePhoto)
//                   self.photosInAnimation.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
//                   self.photosInAnimation.center = CGPoint(x: self.blackView.center.x, y: self.blackView.center.y - 55)
//            self.photosInAnimation.isOpaque = true
//
//            let currentPhoto = arrayOfPhoto[index]
//            self.photosInAnimation.image = UIImage(named: currentPhoto)
////                   self.photosInAnimation.layer.cornerRadius = 0
////                   self.photosInAnimation.layer.borderWidth = 0
//     //       self.closeButtonView.layoutIfNeeded()
//       //     self.blackView.layoutIfNeeded()
//                //   self.layoutIfNeeded()
//          //  self.setupSubviews()
//               } completion:{ _ in
//                   UIImageView.animate(withDuration: 0.3, delay: 0){
//                       self.closeButtonView.layer.opacity = 1
//                   }
//
//               }
//
//    }
}

extension PhotosViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Выбрана ячейка \(indexPath.item)")
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, animations: ({
            cell?.frame = collectionView.bounds
            
        }), completion: nil)
    }
}
