//
//  UserInfoScreenViewController.swift
//  Github_Application
//
//  Created by Decagon on 21/11/2021.
//

import UIKit

class UserInfoScreenViewController: UIViewController {
  
  let dataLoader = DataLoader()
  var userDetails: UserInfoDetails?
  
  lazy var userImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .clear
    imageView.layer.cornerRadius = 20
    imageView.image = UIImage(named: "avatar-placeholder-dark")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var usernameLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .label
    name.numberOfLines = 1
    name.font =  UIFont.boldSystemFont(ofSize: 20)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  lazy var nameLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .label
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  lazy var locationLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .label
    name.numberOfLines = 0
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  lazy var bioLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .label
    name.numberOfLines = 0
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  // MARK: - PROFILE UI VIEW
  lazy var profileView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.97, alpha: 1.00)
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var publicReposLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .black
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "Public Repos"
    return name
  }()
  
  lazy var publicGistsLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .black
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "Public Gists"
    return name
  }()
  
  lazy var publicReposValuesLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .black
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "0"
    return name
  }()
  
  lazy var publicGistsValuesLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .black
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "0"
    return name
  }()
  
  lazy var userProfileButton: UIButton = {
    let button = UIButton()
    button.setTitle("Github Profile", for: .normal)
    button.addTarget(self, action: #selector(viewProfileButton), for: .touchUpInside)
    button.backgroundColor = .purple
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 8
    return button
  }()
  
  
  // MARK: - FOLLWERS UI VIEW
  lazy var followersView: UIView = {
    let view = UIView()
    view.backgroundColor =  UIColor(red: 0.93, green: 0.93, blue: 0.97, alpha: 1.00)
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var followersLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .black
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "Followers"
    return name
  }()
  
  lazy var followingLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .black
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "Following"
    return name
  }()
  
  lazy var numberOfFollowersLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .black
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "0"
    return name
  }()
  
  lazy var numberOfFollowingsLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .black
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "0"
    return name
  }()
  
  lazy var getFollowerButton: UIButton = {
    let button = UIButton()
    button.setTitle("Get Followers", for: .normal)
    button.addTarget(self, action: #selector(getFollowersButton), for: .touchUpInside)
    button.backgroundColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 8
    return button
  }()
  
  lazy var dateLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .label
    name.numberOfLines = 0
    name.textAlignment = .center
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "Github since Jan 2015"
    return name
  }()
  func configure(with urlString: String){
    guard let url = URL(string: urlString) else {
      return
    }
    
    URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let data = data , error == nil else {
        return
      }
      
      DispatchQueue.main.async { [self] in
        let image = UIImage(data: data)
        self!.userImageView.image = image
      }
    }.resume()
  }
  var followersName = ""
  var image = UIImage()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    setupViewsConstraints()
    usernameLabel.text = followersName
    dataLoader.pullUserInfoData(username: usernameLabel.text!) { [self] data in
      userDetails = data
      guard let userDetails = userDetails else { return }
      DispatchQueue.main.async {
        nameLabel.text = userDetails.name
        bioLabel.text = userDetails.bio
        locationLabel.text = userDetails.location
        publicReposValuesLabel.text = "\(userDetails.public_repos)"
        publicGistsValuesLabel.text = "\(String(describing: userDetails.public_gists))"
        numberOfFollowersLabel.text = "\(String(describing: userDetails.followers))"
        numberOfFollowingsLabel.text = "\(String(describing: userDetails.following))"
        
      }
    }
    
  }
  
  @objc func getFollowersButton() {
    
  }
  
  @objc func viewProfileButton() {
    
  }
  
  func setUpViews() {
    view.addSubview(userImageView)
    view.addSubview(usernameLabel)
    view.addSubview(nameLabel)
    view.addSubview(locationLabel)
    view.addSubview(bioLabel)
    view.addSubview(profileView)
    view.addSubview(followersView)
    view.addSubview(dateLabel)
    followersView.addSubview(getFollowerButton)
    followersView.addSubview(followersLabel)
    followersView.addSubview(followingLabel)
    followersView.addSubview(numberOfFollowersLabel)
    followersView.addSubview(numberOfFollowingsLabel)
    profileView.addSubview(userProfileButton)
    profileView.addSubview(publicReposLabel)
    profileView.addSubview(publicGistsLabel)
    profileView.addSubview(publicReposValuesLabel)
    profileView.addSubview(publicGistsValuesLabel)
  }
  
  func setupViewsConstraints() {
    setUpViews()
    
    let stack = UIStackView(arrangedSubviews: [usernameLabel, nameLabel, locationLabel] )
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 1
    view.addSubview(stack)
    NSLayoutConstraint.activate ([
      
      
      userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      userImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      userImageView.heightAnchor.constraint(equalToConstant: 150),
      userImageView.widthAnchor.constraint(equalToConstant: 150),
      
      stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
      stack.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 30),
      stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      
      bioLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
      bioLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      bioLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      
      profileView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 20),
      profileView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      profileView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      profileView.heightAnchor.constraint(equalToConstant: 150),
      
      publicReposLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 30),
      publicReposLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 30),
      
      publicGistsLabel.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 30),
      publicGistsLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -30),
      
      publicReposValuesLabel.topAnchor.constraint(equalTo: publicReposLabel.bottomAnchor, constant: 10),
      publicReposValuesLabel.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 60),
      
      publicGistsValuesLabel.topAnchor.constraint(equalTo: publicGistsLabel.bottomAnchor, constant: 10),
      publicGistsValuesLabel.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -60),
      
      userProfileButton.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 10),
      userProfileButton.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -10),
      userProfileButton.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -10),
      userProfileButton.heightAnchor.constraint(equalToConstant: 50),
      
      followersView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 20),
      followersView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      followersView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      followersView.heightAnchor.constraint(equalToConstant: 150),
      
      followingLabel.topAnchor.constraint(equalTo: followersView.topAnchor, constant: 30),
      followingLabel.leadingAnchor.constraint(equalTo: followersView.leadingAnchor, constant: 30),
      
      followersLabel.topAnchor.constraint(equalTo: followersView.topAnchor, constant: 30),
      followersLabel.trailingAnchor.constraint(equalTo: followersView.trailingAnchor, constant: -30),
      
      numberOfFollowersLabel.topAnchor.constraint(equalTo: followersLabel.bottomAnchor, constant: 10),
      numberOfFollowersLabel.trailingAnchor.constraint(equalTo: followersView.trailingAnchor, constant: -60),
      
      numberOfFollowingsLabel.topAnchor.constraint(equalTo: followingLabel.bottomAnchor, constant: 10),
      numberOfFollowingsLabel.leadingAnchor.constraint(equalTo: followersView.leadingAnchor, constant: 60),
      
      getFollowerButton.leadingAnchor.constraint(equalTo: followersView.leadingAnchor, constant: 10),
      getFollowerButton.trailingAnchor.constraint(equalTo: followersView.trailingAnchor, constant: -10),
      getFollowerButton.bottomAnchor.constraint(equalTo: followersView.bottomAnchor, constant: -10),
      getFollowerButton.heightAnchor.constraint(equalToConstant: 50),
      
      dateLabel.topAnchor.constraint(equalTo: followersView.bottomAnchor, constant: 20),
      dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
      
    ])
  }
}
