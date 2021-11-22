//
//  followersListViewController.swift
//  Github_Application
//
//  Created by Decagon on 21/11/2021.
//

import UIKit

class followersListViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  let dataLoader = DataLoader()
  var userDetails: UserInfoDetails?
  
  lazy var followersCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 20
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  .systemBackground
    collectionView.showsVerticalScrollIndicator =  false
    collectionView.isUserInteractionEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  let usernameLabel: UILabel = {
    let text = UILabel()
    text.font = UIFont(name: "Helvetica", size: 25)
    text.numberOfLines = 1
    text.textColor = .label
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
  }()
  
  let noFollowerLabel: UILabel = {
    let text = UILabel()
    text.font = UIFont(name: "Helvetica", size: 30)
    text.numberOfLines = 0
    text.textAlignment = .center
    text.textColor = .label
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
  }()
  
  
  var followers = [FollwersDetails]()
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    followers.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? FollwersCollectionViewCell else { return UICollectionViewCell() }
    let imageUrlString = followers[indexPath.row].avatarURL
    DispatchQueue.main.async { [self] in
      cell.followersName.text =  followers[indexPath.row].login
      cell.configure(with: imageUrlString)
    }
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 150)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let viewController = UserInfoScreenViewController()
    viewController.followersName = followers[indexPath.row].login
    viewController.configure(with: followers[indexPath.row].avatarURL)
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  let cellId = "cellId"
  override func viewDidLoad() {
    super.viewDidLoad()
    followersCollectionView.register(FollwersCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    view.backgroundColor = .systemBackground
    setupConstraints()
    followersCollectionView.reloadData()
  }
  
  func addDefaultViews() {
    view.addSubview(followersCollectionView)
    view.addSubview(usernameLabel)
    view.addSubview(noFollowerLabel)
  }
  
  func setupConstraints() {
    addDefaultViews()
    
    NSLayoutConstraint.activate([
      usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      noFollowerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
      noFollowerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
      noFollowerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
      noFollowerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
    ])
    followersCollectionView.anchorWithConstantsToTop(top:view.topAnchor,
                                                     left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 140, leftConstant: 20, bottomConstant: 30, rightConstant: 20)
    
  }
  
}
