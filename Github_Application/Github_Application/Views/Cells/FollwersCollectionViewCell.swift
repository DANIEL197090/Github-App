//
//  FollwersCollectionViewCell.swift
//  Github_Application
//
//  Created by Decagon on 21/11/2021.
//

import UIKit

class FollwersCollectionViewCell: UICollectionViewCell {
  
  let followersImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let followersName: UILabel = {
    let text = UILabel()
    text.font = UIFont(name: "Helvetica", size: 12)
    text.numberOfLines = 1
    text.textColor = .label
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
  }()
  
  var selectionLabel : UILabel = {
    let button = UILabel()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var isEditing: Bool = false {
    didSet {
    selectionLabel.isHidden = !isEditing
    }
  }
  
  override var isSelected: Bool {
    didSet {
      if isEditing  {
        selectionLabel.text = isSelected ? "✔︎" : ""
      }
    }
  }
  
  
  override func prepareForReuse() {
    super.prepareForReuse()
    selectionLabel.isHidden = !isEditing
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpViews()
  }
  
  
  func setUpViews() {
    addSubview(followersName)
    addSubview(followersImageView)
    addSubview(selectionLabel)
    followersName.anchorWithConstantsToTop(top: followersImageView.bottomAnchor, left: leftAnchor,
                                           bottom: bottomAnchor,
                                           right: rightAnchor,
                                           topConstant: 5,
                                           leftConstant: 10,
                                           bottomConstant: 0, rightConstant: 0)
    followersImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 20, rightConstant: 0)
    selectionLabel.anchorWithConstantsToTop(top: followersImageView.bottomAnchor, left: followersName.leftAnchor, bottom: bottomAnchor, right: followersName.rightAnchor, topConstant: 0, leftConstant: 75, bottomConstant: 0, rightConstant: 0)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with urlString: String){
    guard let url = URL(string: urlString) else {
      return
    }
    
    URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let data = data , error == nil else {
        return
      }
      
      DispatchQueue.main.async {
        let image = UIImage(data: data)
        self?.followersImageView.image = image
      }
    }.resume()
  }
}


extension UIView {
  func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
    anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
  }
  func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                                bottom: NSLayoutYAxisAnchor? = nil,
                                right: NSLayoutXAxisAnchor? = nil,
                                topConstant: CGFloat = 0,
                                leftConstant: CGFloat = 0,
                                bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
    translatesAutoresizingMaskIntoConstraints = false
    if let top = top {
      topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
    }
    if let bottom = bottom {
      bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
    }
    if let left = left {
      leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
    }
    if let right = right {
      rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
    }
  }
  
}

class follwers: UIImageView {
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.cornerRadius = frame.height / 2
  }
}
