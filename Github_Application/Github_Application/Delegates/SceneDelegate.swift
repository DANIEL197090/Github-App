//
//  SceneDelegate.swift
//  Github_Application
//
//  Created by Decagon on 20/11/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
      guard let windowScene = (scene as? UIWindowScene) else { return }
      
      let rootViewCOntroller = TabBarViewController()
      
      let navigationController = UINavigationController(rootViewController: rootViewCOntroller)
        
      window = UIWindow(frame: windowScene.coordinateSpace.bounds)
      window?.windowScene = windowScene
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()
  }


}

