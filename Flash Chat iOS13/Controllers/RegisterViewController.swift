//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Zion Tuiasoa on 2/26/2021.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    let alert = UIAlertController(title: "OH NO!", message: "Password needs to contain 6 characters or more", preferredStyle: .alert)
                    
                    let action = UIAlertAction(title: "Fine", style: .default, handler: { _ in
                        self.passwordTextfield.becomeFirstResponder()
                    })
                    
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                    return
                } else {
                    // Navigate to chat vc
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
    
}
