//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        
        setupViews()
        
    }
    
    private func setupViews(){
        self.view = getRootView()
        let photoView = getPhotoView()
        self.view.addSubview(photoView)
        let nameView = getNameView()
        self.view.addSubview(nameView)
        let descriptionView = getDescriptionView()
        self.view.addSubview(descriptionView)
        let showStatusView = getShowStatusView()
        self.view.addSubview(showStatusView)
        showStatusView.layer.cornerRadius = 4.0
        showStatusView.layer.borderWidth = 2.0
        showStatusView.layer.borderColor = UIColor.blue.cgColor
        showStatusView.layer.shadowRadius = 4.0
        showStatusView.layer.shadowOpacity = 0.7
        showStatusView.layer.shadowColor = UIColor.black.cgColor
        showStatusView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        
//        let view = UIView()
//        view.backgroundColor = .white
//        self.view = view
    }
    
    private func getRootView()->
        UIView{
            let view = UIView()
            view.backgroundColor = .white
            return view
    }
    
    private func getPhotoView() ->
    UIView{
        let viewFrame = CGRect(x: 16, y: 16, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .darkGray
        return view
    }
    private func getNameView() ->
    UIView{
        let viewFrame = CGRect(x: 132, y: 27, width: 200, height: 25)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .green
        return view
    }
    private func getDescriptionView() ->
    UIView{
        let viewFrame = CGRect(x: 132, y: 60, width: 200, height: 20)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        return view
    }
    private func getShowStatusView() ->
    UIView{
        let viewFrame = CGRect(x: 16, y: 132, width: 300, height: 50)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .blue
        return view
    }
    
    
}


PlaygroundPage.current.liveView = MyViewController()
