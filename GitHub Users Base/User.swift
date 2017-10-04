//
//  User.swift
//  GitHub Users Base
//
//  Created by Marcin Pietrzak on 04.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import Foundation

struct User {
    let login: String
    let avatar: String
    let giturl: String
    let name: String
    let location: String
    let bio: String
    let repos: Int
    let followers: Int
    let following: Int
}

extension User {
    
    struct Key {
        static let login = "login"
        static let avatar = "avatar_url"
        static let giturl = "html_url"
        static let name = "name"
        static let location = "location"
        static let bio = "bio"
        static let repos = "public_repos"
        static let followers = "followers"
        static let following = "following"
    }
    
    init?(json: [String: AnyObject]) {
        guard let loginString = json[Key.login] as? String,
        let avatarURL = json[Key.avatar] as? String,
        let gitURL = json[Key.giturl] as? String,
        let nameString = json[Key.name] as? String,
        let locationString = json[Key.location] as? String,
        let bioString = json[Key.bio] as? String,
        let reposValue = json[Key.repos] as? Int,
        let followersValue = json[Key.followers] as? Int,
        let followingValue = json[Key.following] as? Int else { return nil }
        
        self.login = loginString
        self.avatar = avatarURL
        self.giturl = gitURL
        self.name = nameString
        self.location = locationString
        self.bio = bioString
        self.repos = reposValue
        self.followers = followersValue
        self.following = followingValue
    }
    
}
