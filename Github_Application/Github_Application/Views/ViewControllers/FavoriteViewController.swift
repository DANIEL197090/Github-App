//
//  FavoriteViewController.swift
//  Github_Application
//
//  Created by Decagon on 20/11/2021.
//

import UIKit

class FavoriteViewController: UIViewController {
 let data = DataLoader()
  var favorite: [FavoriteModel]?
  
  lazy var favoriteTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = 90
    tableView.dataSource = self
    tableView.delegate = self
    return tableView
  }()
  
  lazy var pageTitleLabel: UILabel = {
    let name = UILabel()
    name.textColor =  .label
    name.numberOfLines = 1
    name.font = UIFont(name: "Helvetica", size: 25)
    name.font = UIFont.boldSystemFont(ofSize: 25)
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "Favorites"
    return name
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemBackground
      view.addSubview(favoriteTableView)
      view.addSubview(pageTitleLabel)
      setupTableViewConstraint()
      navigationController?.navigationBar.isHidden = true
      favoriteTableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
      
    }
    
  func setupTableViewConstraint() {
    favoriteTableView.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: 10).isActive = true
    favoriteTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
    favoriteTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
    favoriteTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    
    pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
    pageTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
  }

}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath) as? FavoriteTableViewCell else {
      return UITableViewCell()
    }
    self.favoriteTableView.tableFooterView = UIView()
    //cell.titleLabel.text = favorite![indexPath.row].login
    cell.backgroundColor = .white
    return cell
    
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath ) {
    tableView.deselectRow(at: indexPath, animated: true)
   
  }
  
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let action = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, completionHandler) in
      do {
      } catch let error {
        print("error deleting from Realm \(error)")
      }
      
    }
    return UISwipeActionsConfiguration(actions: [action])
  }
}
