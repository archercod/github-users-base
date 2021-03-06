//
//  UserDetailsController.swift
//  GitHub Users Base
//
//  Created by Marcin Pietrzak on 04.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit

class UserDetailsController: UIViewController {
    
    var userNameKey = String()
    var user: User?
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLogin: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userRepos: UILabel!
    @IBOutlet weak var userBio: UITextView!
    @IBOutlet weak var userFollowers: UILabel!
    @IBOutlet weak var userFollowing: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUser(userNameKey)
        
    }
}

extension UserDetailsController {
    
    func getUser(_ login: String) {
        User.userByLogin(login) { (user, error) in
           
            if let error = error {
                print(error)
                return
            }
            
            guard let user = user else {
                print("Results is nil")
                return
            }
            
            let viewModel = UserViewModel(model: user)
            self.displayUser(using: viewModel)
            
            debugPrint(user)
            print(user.name)
        }
    }
    
    func displayUser(using viewModel: UserViewModel) {
        userName.text = viewModel.name
        userLogin.text = viewModel.login
        userLocation.text = viewModel.location
        userRepos.text = String(viewModel.repos)
        userFollowing.text = String(viewModel.following)
        userFollowers.text = String(viewModel.followers)
    }
}






