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
    
//    private func profileInformation(){
//      //  let profileIcon = UILabel(frame: CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>))
//    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let v = superview{
            self.center = v.center
        }
    }

}
