//
//  LogInView.swift
//  Navigation
//
//  Created by Наталья Терзьян on 04.01.2023.
//

import UIKit

class LogInView: UIView {

    let logoView:UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
  
    override init(frame: CGRect){
        super .init(frame: frame)
        addAllSubview()
        setupAllView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension LogInView{
    private func addAllSubview(){
        self.addSubview(logoView)
    }
    private func setupAllView(){
        setupLogoView()
    }
    
    private func setupLogoView(){
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
