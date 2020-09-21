//
//  SceneDelegate.swift
//  XCodePreview-Sample-UIKit
//
//  Created by kawaharadai on 2020/09/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = TopViewController()
        self.window = window
        self.window?.makeKeyAndVisible()
    }

}

