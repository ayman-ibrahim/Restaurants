//
//  SceneDelegate.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var scene: UIWindowScene?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let window = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: window)
        
        setRootView()

        self.window?.makeKeyAndVisible()
    }
    
    func setRootView() {
        let config = UICollectionLayoutListConfiguration(appearance: .grouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        let rootViewController = RestaurantsCollectionViewController(collectionViewLayout: layout)
        rootViewController.viewModel = Resolver.restaurantsViewModel
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        self.window?.rootViewController = navigationController
    }
}
