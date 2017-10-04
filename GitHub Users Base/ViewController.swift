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
    }
    
}

