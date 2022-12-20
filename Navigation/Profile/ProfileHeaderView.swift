//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталья Терзьян on 13.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    init(){
        super .init(frame: CGRect(x: 50, y: 50, width: 400, height: 600))
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let statusText = "Waiting for something beautiful, pretty good"
    let profileHeaderName = "Hipster Cat"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let v = superview{
            self.center = v.center
        }
    }
    
    func getRootView()->
    UIView{
        let viewFrame = CGRect(x: 0, y: 100, width: 500, height: 600)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .lightGray
        return view
    }
    
    func getProfileImageView() ->
    UIImageView{
        let viewFrame = CGRect(x: 16, y: 16, width: 100, height: 100)
        let profileImageView = UIImageView(frame: viewFrame)
        profileImageView.image = UIImage(named: "profileIcon")
        return profileImageView
    }
    
    
    func getNameView() ->
    UILabel{
        let viewFrame = CGRect(x: 132, y: 27, width: 200, height: 20)
        let view = UILabel(frame: viewFrame)
        view.text = profileHeaderName
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }
    
    func getDescriptionView() ->
    UILabel{
        let viewFrame = CGRect(x: 132, y: 98, width: 200, height: 20)
        let view = UILabel(frame: viewFrame)
        view.text = statusText
        view.textColor = .gray
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return view
    }
    
    func getShowStatusButton() ->
    UIButton{
        let viewFrame = CGRect(x: 16, y: 132, width: 360, height: 50)
        let button = UIButton(frame: viewFrame)
        button.backgroundColor = .systemBlue
        return button
    }
    
}
