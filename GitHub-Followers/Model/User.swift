//
//  User.swift
//  GitHub-Followers
//
//  Created by Alan Silva on 25/06/22.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepo: Int
    var publicGists: Int
    var htmUrl: String
    var following: Int
    var followers: Int
    var createAt: String    
}
