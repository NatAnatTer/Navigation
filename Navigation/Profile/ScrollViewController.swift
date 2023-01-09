//
//  ScrollViewController.swift
//  Navigation
//
//  Created by Наталья Терзьян on 09.01.2023.
//

import UIKit

class ScrollViewController: UIViewController {

    let scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
      //  view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000000)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
