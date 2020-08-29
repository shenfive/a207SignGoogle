//
//  ViewController.swift
//  a207SignGoogle
//
//  Created by 申潤五 on 2020/8/29.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }


}

