//
//  ViewController.swift
//  GitHub Users Base
//
//  Created by Marcin Pietrzak on 04.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var showButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showButton.layer.cornerRadius = 15.0
        loginTextField.layer.cornerRadius = 15.0
        loginTextField.layer.borderWidth = 2.0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPressed(_ sender: Any) {
        if loginTextField.text != "" {
            performSegue(withIdentifier: "userDetails", sender: self)
        } else {
            emptyTextFieldAlert()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userDetailsController = segue.destination as! UserDetailsController
        userDetailsController.userNameKey = loginTextField.text!
    }
    
    func emptyTextFieldAlert() {
        let alertController = UIAlertController(title: "Empty text field", message: "Please enter GitHub member user name and tap show button", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

