//
//  UserViewModel.swift
//  GitHub Users Base
//
//  Created by Marcin Pietrzak on 06.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import Foundation
import UIKit

struct UserViewModel {
    let login: String
    let avatar: String
    let giturl: String
    let name: String
    let location: String
    let bio: String
    let repos: Int
    let followers: Int
    let following: Int
    
    init(model: User) {
        self.login = model.login
        self.avatar = model.avatar
        self.giturl = model.giturl
        self.name = model.name
        self.location = model.location
        self.bio = model.bio
        self.repos = model.repos
        self.followers = model.followers
        self.following = model.following
    }
    
}
