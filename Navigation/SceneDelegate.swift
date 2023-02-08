//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Наталья Терзьян on 05.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    func createFeedController() -> UINavigationController{
        let feedNC = UINavigationController(rootViewController: FeedViewController())
        feedNC.tabBarItem = UITabBarItem(title: "FirstNC", image: UIImage(systemName: "house"), tag: 0)
        feedNC.title = "Лента"
        return feedNC
    }
    
    func createProfileController() -> UINavigationController{
//        let profileNC = UINavigationController(rootViewController: ProfileViewController())
        let profileNC = UINavigationController(rootViewController: LogInViewController())
        profileNC.tabBarItem = UITabBarItem(title: "SecondNC", image: UIImage(systemName: "person.circle"), tag: 1)
        profileNC.title = "Профиль"
    
        return profileNC
    }
    
    func createTabBar() -> UITabBarController{
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFeedController(), createProfileController()]
       // tabBar.tabBar.isHidden = true
        return tabBar
    }
    
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = createTabBar()
        window.makeKeyAndVisible()
        self.window = window
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

