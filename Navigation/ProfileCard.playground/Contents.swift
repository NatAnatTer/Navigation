//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        
        setupViews()
        
    }
    
    private func setupViews(){
        self.view = getRootView()
       
        let profileIconView = getProfileImageView()
        self.view.addSubview(profileIconView)
        profileIconView.layer.cornerRadius = 50
        profileIconView.layer.borderWidth = 3
        profileIconView.layer.borderColor = UIColor.white.cgColor
        profileIconView.contentMode = .scaleAspectFill
        profileIconView.layer.masksToBounds = true
        
//        let photoFrameView = getPhotoFrameView()
//        self.view.addSubview(photoFrameView)
//        let photoView = getPhotoView()
//        photoFrameView.addSubview(photoView)
//        set(view: photoView, toCenterOFview: photoFrameView)
        
        let nameView = getNameView()
        self.view.addSubview(nameView)
        
        
        let descriptionView = getDescriptionView()
        self.view.addSubview(descriptionView)
        
        
        let showStatusView = getShowStatusButton()
        self.view.addSubview(showStatusView)
        showStatusView.layer.cornerRadius = 10.0
        showStatusView.layer.borderWidth = 2.0
        showStatusView.layer.borderColor = UIColor.systemBlue.cgColor
        showStatusView.layer.shadowRadius = 4.0
        showStatusView.layer.shadowOpacity = 0.7
        showStatusView.layer.shadowColor = UIColor.black.cgColor
        showStatusView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        showStatusView.setTitle("Show status", for: .normal)
        
        

    }
    
    private func getRootView()->
        UIView{
            let view = UIView()
            view.backgroundColor = .systemGray
            return view
    }
    
    private func getProfileImageView() ->
    UIImageView{
        let viewFrame = CGRect(x: 16, y: 16, width: 100, height: 100)
        let profileImageView = UIImageView(frame: viewFrame)
        profileImageView.image = UIImage(named: "profileIcon")
        return profileImageView
    }
    
//    private func getPhotoFrameView() ->
//    UIView{
//        let viewFrame = CGRect(x: 16, y: 16, width: 100, height: 100)
//        let view = UIView(frame: viewFrame)
//        view.backgroundColor = .darkGray
//        return view
//    }
    
//    private func getPhotoView() ->
//    UIView{
//        let viewFrame = CGRect(x: 16, y: 16, width: 90, height: 90)
//        let view = UIView(frame: viewFrame)
//        view.backgroundColor = .white
//        return view
//    }
//
    
    
    private func getNameView() ->
    UILabel{
        let viewFrame = CGRect(x: 132, y: 27, width: 200, height: 20)
        let view = UILabel(frame: viewFrame)
        view.text = "Hipster Cat"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }
//    UITextView{
//        let viewFrame = CGRect(x: 132, y: 27, width: 200, height: 20)
//
//        let view = UITextView(frame: viewFrame) //(frame: viewFrame)//(frame: self.view.bounds)
//        view.text = "Hipster Cat"
//        view.contentInset = UIEdgeInsets(top: -10, left: -5, bottom: 0, right: 0)
//        view.font = UIFont.systemFont(ofSize: 18)
//        view.textColor = .black
//        view.backgroundColor = .systemGray
//
//        return view
//    }
//    UIView{
//        let viewFrame = CGRect(x: 132, y: 27, width: 200, height: 25)
//        let view = UIView(frame: viewFrame)
//        view.backgroundColor = .green
//        return view
//    }
    private func getDescriptionView() ->
    UIView{
        let viewFrame = CGRect(x: 132, y: 60, width: 200, height: 20)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        return view
    }
    private func getShowStatusButton() ->
    UIButton{
        let viewFrame = CGRect(x: 16, y: 132, width: 300, height: 50)
        let button = UIButton(frame: viewFrame)
        button.backgroundColor = .systemBlue
        return button
    }
    
//    private func set(view moveView: UIView, toCenterOFview baseView: UIView){
//        let moveViewWidth = moveView.frame.width
//        let moveViewHeight = moveView.frame.height
//
//        let baseViewWidth = baseView.bounds.width
//        let baseViewHeight = baseView.bounds.height
//
//        let newXCoordinate = (baseViewWidth - moveViewWidth)/2
//        let newYCoordinate = (baseViewHeight - moveViewHeight)/2
//
//        moveView.frame.origin = CGPoint(x: newXCoordinate, y: newYCoordinate)
//    }
//
    
    
}


PlaygroundPage.current.liveView = MyViewController()
