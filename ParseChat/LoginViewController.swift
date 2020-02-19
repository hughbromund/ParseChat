//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Hugh Bromund on 2/19/20.
//  Copyright © 2020 Hugh Bromund. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var UsernameTextField: UITextField!
    
    
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        
        // set user properties
        newUser.username = UsernameTextField.text
        // newUser.email = "N/A"
        newUser.password = PasswordTextField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
        }
    }
    
    func loginUser() {

       let username = UsernameTextField.text ?? ""
       let password = PasswordTextField.text ?? ""

       PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
              print("User log in failed: \(error.localizedDescription)")
            } else {
              print("User logged in successfully")
              // display view controller that needs to shown after successful login
            }
         }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignupDidPress(_ sender: Any) {
    }
    
    @IBAction func LoginDidPress(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
