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
        self.view.backgroundColor = .systemGray6
        self.navigationItem.title = "Photo Gallery"
        photoView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(photoView)
        let safeLayout = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 8),
            photoView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 8),
            photoView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 8),
            photoView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor, constant: -8)
        ])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
