//
//  FavoriteTableViewCell.swift
//  Github_Application
//
//  Created by Decagon on 22/11/2021.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
  
  static let identifier = "FavoriteTableViewCellIdentifier"

lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Helvetica", size: 19)
    label.text = "Username here"
    return label
  }()

lazy var userImageView: UIImageView = {
  let image = UIImageView()
  image.translatesAutoresizingMaskIntoConstraints = false
  image.contentMode = .scaleAspectFit
  image.layer.cornerRadius = 20
  image.image = UIImage(named: "avatar-placeholder-dark")
  return image
}()


override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(titleLabel)
    addSubview(userImageView)
    cellConstraints()
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
        self?.userImageView.image = image
      }
    }.resume()
  }
  
  func cellConstraints() {
    
    let stack = UIStackView(arrangedSubviews: [userImageView, titleLabel])
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .horizontal
    stack.distribution = .fillEqually
    stack.spacing = 0
    addSubview(stack)

    _ = stack.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: -60, bottomConstant: 5, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    
  }

}

extension UIView {
  
  func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
    translatesAutoresizingMaskIntoConstraints = false
    
    var anchors = [NSLayoutConstraint]()
    
    if let top = top {
      anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
    }
    
    if let left = left {
      anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
    }
    
    if let bottom = bottom {
      anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
    }
    
    if let right = right {
      anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
    }
    
    if widthConstant > 0 {
      anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
    }
    

    if heightConstant > 0 {
      anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
    }
    
    anchors.forEach({$0.isActive = true})
    
    return anchors
  }
  
}
