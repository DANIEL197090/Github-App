//
//  SearchScreenViewController.swift
//  Github_Application
//
//  Created by Decagon on 20/11/2021.
//

import UIKit

class SearchScreenViewController: UIViewController {
  
  lazy var userImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .clear
    imageView.image = UIImage(named: "avatar-placeholder-dark")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var titleLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .label
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "Followers"
    return name
  }()
  
  lazy var titleTextView: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.tintColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
    textField.placeholder = "Enter Username"
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = .clear
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 8
    textField.font = UIFont(name: "Helvetica", size: 14)
    return textField
  }()
  
  lazy var addButton: UIButton = {
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
  
  func changeImage() {
    
  }
  
  private func updateImageForCurrentTraitCollection() {
    switch traitCollection.userInterfaceStyle {
    case .light:
      userImageView.image = UIImage(named: "avatar-placeholder-dark")
    case .dark:
      userImageView.image = UIImage(named: "avatar-placeholder")
    default:
      print("nice")
    }
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
      updateImageForCurrentTraitCollection()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupConstraint()
    view.backgroundColor = .systemBackground
   
  }
  
  @objc func getFollowersButton() {
    
  }
  
  func setupSubviews() {
    view.addSubview(titleLabel)
    view.addSubview(titleTextView)
    view.addSubview(userImageView)
    view.addSubview(addButton)
  }
  
  func setupConstraint() {
    setupSubviews()

    NSLayoutConstraint.activate ([
      
      userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
      userImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
      userImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
      userImageView.heightAnchor.constraint(equalToConstant: 200),
      
      titleLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
      titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 170),
      
      titleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
      titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      titleTextView.heightAnchor.constraint(equalToConstant: 45),
      
      addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
      addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      addButton.heightAnchor.constraint(equalToConstant: 52)
    ])
  }

}

class LeftPaddedTextField: UITextField {
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  
}

