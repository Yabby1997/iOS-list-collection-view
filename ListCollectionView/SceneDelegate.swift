//
//  SceneDelegate.swift
//  ListCollectionView
//
//  Created by Seunghun Yang on 2022/01/19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
    }
}

