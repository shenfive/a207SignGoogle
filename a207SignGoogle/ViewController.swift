//
//  ViewController.swift
//  a207SignGoogle
//
//  Created by 申潤五 on 2020/8/29.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutBut: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user{
                self.setSignedUI()
            }else{
                self.setSignOutUI()
            }
        }
    }
    
    func setSignedUI(){
        signInButton.isEnabled = false
        signOutBut.isEnabled = true
        if let username = Auth.auth().currentUser?.displayName{
            statusLabel.text = "歡迎：" + username
        }
    }
    
    func setSignOutUI(){
        signInButton.isEnabled = true
        signOutBut.isEnabled = false
        statusLabel.text = "請登入"
        
    }
    
    
    
    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error.localizedDescription)
        }
        
        
        
    }
    

}

