//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Николай Циминтия on 17.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let coordinator = CharacterCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.frame = windowScene.coordinateSpace.bounds
        
        window?.rootViewController = coordinator.navigationController
        coordinator.start()
        
        window?.makeKeyAndVisible()
    }

}

