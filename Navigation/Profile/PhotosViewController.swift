//
//  PhotosViewControllers.swift
//  Navigation
//
//  Created by Наталья Терзьян on 24.01.2023.
//

import UIKit

class PhotosViewController: UIViewController {

    let photoView = PhotosCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Photo Gallery"
        photoView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(photoView)
        let safeLayout = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            photoView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            photoView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            photoView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: 0)
        ])
        
        
    }
    



}
