//
//  UserInfoModel.swift
//  Github_Application
//
//  Created by Decagon on 21/11/2021.
//

import Foundation

// MARK: - HTTPSAPIGithubCOMUsersNonunicorn
struct UserInfoDetails: Codable {
  let login: String?
    let id: Int?
    let avatar_url: String?
    let followers_url: String?
    let followingURL, gists_url: String?
    let repos_url: String?
    let name: String?
    let company, blog: String?
    let location, email, hireable: String?
    let bio: String?
    let public_repos, public_gists, followers, following: Int?
    let created_at, uupdated_at: String?

}

