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

    let  photoCollectionView: UICollectionView! = {
        let view = UICollectionView(frame: .zero)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        view.collectionViewLayout = flowLayout
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    let currentPhoto: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.backgroundColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 6
//        view.contentMode = .scaleAspectFit
//        view.clipsToBounds = true
//        return view
//    }()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.photoCollectionView.delegate = self
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.register(PhotoProfileCollectionViewCell.self, forCellWithReuseIdentifier: PhotoProfileCollectionViewCell.identifire)
        
        addAllSubview()
               setupAllView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.itemSize = CGSize(width: 150, height: 180)
//        flowLayout.minimumLineSpacing = 2.0
//        flowLayout.minimumInteritemSpacing = 5.0
//        self.photoCollectionView.collectionViewLayout = flowLayout
//        self.photoCollectionView.showsHorizontalScrollIndicator = false
        
        self.photoCollectionView.delegate = self
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.register(PhotoProfileCollectionViewCell.self, forCellWithReuseIdentifier: PhotoProfileCollectionViewCell.identifire)
       // addAllSubview()
       // setupAllView()
    }
    
 
    
//    override   init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super .init(style: style, reuseIdentifier: reuseIdentifier)
//
//        addAllSubview()
//        setupAllView()
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            self.layer.cornerRadius = 10
    }

}

extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    func updateCellWith(row: String) {
//        self.rowWithPhotos = row
//        self.collectionView.reloadData()
//    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    private func addAllSubview(){
        self.contentView.addSubview(photoCollectionView)

    }

    private func setupAllView(){
        NSLayoutConstraint.activate([
            self.photoCollectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.photoCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.photoCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.photoCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            self.photoCollectionView.heightAnchor.constraint(equalToConstant: 200),
            self.photoCollectionView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}







//class PhotosTableViewCell: UITableViewCell {
//
//    static let identifire  = "PhotosTableViewCell"
//
//    let currentPhoto: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.backgroundColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 6
//        view.contentMode = .scaleAspectFit
//        view.clipsToBounds = true
//        return view
//    }()
//
//   // let collectionPhotoView: UICollectionView
//
////    override   init(frame: CGRect) {
////           super .init(frame: frame)
//
//    override   init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super .init(style: style, reuseIdentifier: reuseIdentifier)
//
//        addAllSubview()
//        setupAllView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
////    override func setSelected(_ selected: Bool, animated: Bool) {
////        super.setSelected(selected, animated: animated)
////    }
//
//    override func layoutSubviews() {
//            super.layoutSubviews()
//            self.layer.cornerRadius = 10
//    }
//
//}
//
//extension PhotosTableViewCell{
//    private func addAllSubview(){
//        self.contentView.addSubview(currentPhoto)
//
//    }
//
//    private func setupAllView(){
//        NSLayoutConstraint.activate([
//            self.currentPhoto.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
//            self.currentPhoto.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
//            self.currentPhoto.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
//            self.currentPhoto.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
//            self.currentPhoto.heightAnchor.constraint(equalToConstant: 200),
//            self.currentPhoto.widthAnchor.constraint(equalToConstant: 200)
//        ])
//    }
//}







//class PhotosTableViewCell: UITableViewCell {
//
//    static let identifire  = "PhotosTableViewCell"
//
//    let contentOfPost: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.backgroundColor = .black
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 6
//        view.contentMode = .scaleAspectFit
//        view.clipsToBounds = true
//        return view
//    }()
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        addAllSubview()
//        setupAllView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//
//}
//
//extension PhotosTableViewCell{
//    private func addAllSubview(){
//        self.contentView.addSubview(contentOfPost)
//
//    }
//
//    private func setupAllView(){
//        NSLayoutConstraint.activate([
//            self.contentOfPost.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
//            self.contentOfPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
//            self.contentOfPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
//            self.contentOfPost.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
//            self.contentOfPost.heightAnchor.constraint(equalToConstant: 200),
//            self.contentOfPost.widthAnchor.constraint(equalToConstant: 200)
//        ])
//    }
//}
