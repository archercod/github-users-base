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
    
    static func userNameForURL(_ username: String) -> String {
        return "https://api.github.com/users/\(username)"
    }
    
    static func userByLogin(_ login: String, completionHandler: @escaping (User?, BackendError?) -> Void) {
        
        let endpoint = User.userNameForURL(login)
        guard let url = URL(string: endpoint) else {
            let error = BackendError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                let error = BackendError.otherError(reason: "Something goes wrong")
                completionHandler(nil, error)
                return
            }
            
            guard let responseData = data else {
                let error = BackendError.objectSerialization(reason: "No data in response")
                completionHandler(nil, error)
                return
            }
            
            DispatchQueue.main.async {
                do {
                    if let userJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject], let user = User(json: userJSON) {
                        print(user)
                    } else {
                        let error = BackendError.objectSerialization(reason: "Couldn't create a user from the JSON")
                        completionHandler(nil, error)
                    }
                }
                catch {
                    let error = BackendError.otherError(reason: "Couldn't convert data to JSON")
                    completionHandler(nil, error)
                    return
                }
            }
            
        }
        task.resume()
    }
    
}
