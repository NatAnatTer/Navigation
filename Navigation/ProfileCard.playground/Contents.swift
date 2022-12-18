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
    
}


PlaygroundPage.current.liveView = MyViewController()
