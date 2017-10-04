//
//  UserViewModel.swift
//  GitHub Users Base
//
//  Created by Marcin Pietrzak on 04.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import Foundation
import UIKit

struct UserViewModel {
    let login: String
    let avatar: UIImage
    let giturl: String
    let name: String
    let location: String
    let bio: String
    let repos: Int
    let followers: Int
    let following: Int
    
    init(model: User) {
        self.login = "\(login)"
        
        self.avatar = UIImage()
        
        self.giturl = model.giturl
        self.
    }
}
