//
//  ViewController.swift
//  Naturely
//
//  Created by Ditry D'ateian on 3/30/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var username_textfield: UITextField!
    @IBOutlet weak var password_textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dismiss keyboard if user taps outside of textfield (the view controller itself)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    
    @IBAction func login_press(_ sender: Any) {
        let username = username_textfield.text!
        let password = password_textfield.text!
        
        //finding user in parse
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "", sender: nil) //segue to feed viewcontroller
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    //dismissing keyboard when user touches outside
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}
