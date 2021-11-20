//
//  TabBarViewController.swift
//  Github_Application
//
//  Created by Decagon on 20/11/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
// MARK: Create instance of viewControllers
      navigationController?.isNavigationBarHidden = true
        let searchScreenViewController = SearchScreenViewController()
        let favoriteViewController = FavoriteViewController()
// MARK: Assign viewController to tab Bar
      self.setViewControllers([searchScreenViewController, favoriteViewController], animated: false)
      guard let items = self.tabBar.items else { return }
      let images = ["star.fill", "star.fill"]
      for item in 0...1 {
        items[item].image = UIImage(systemName: images[item])
      }
// MARK: Changing tint Color
      self.tabBar.tintColor = .gray
    }
}
