//
//  FavoriteViewController.swift
//  Github_Application
//
//  Created by Decagon on 20/11/2021.
//

import UIKit

class FavoriteViewController: UIViewController {
 let data = DataLoader()
  var userDetails: UserInfoDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemBackground
//      data.pullUserInfoData { [self] userInfo in
//        userDetails = userInfo
//        guard let userDetails = userDetails else { return }
//        print("This is UserData: \(userDetails.followers)")
//      }
      
    }
    

}
