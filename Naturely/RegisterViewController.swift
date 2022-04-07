//
//  RegisterViewController.swift
//  Naturely
//
//  Created by Luis Mora on 4/6/22.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {
    @IBOutlet weak var firstname_textfield: UITextField!
    @IBOutlet weak var lastname_textfield: UITextField!
    @IBOutlet weak var username_textfield: UITextField!
    @IBOutlet weak var email_textfield: UITextField!
    @IBOutlet weak var password_textfield: UITextField!
    @IBOutlet weak var create_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func create_press(_ sender: Any) {
        let user = PFUser()
        user.username = username_textfield.text
        user.email = email_textfield.text
        user.password = password_textfield.text
        
        //creating user object
        user.signUpInBackground {
            (success, error) in
            if success {
                self.performSegue(withIdentifier: "", sender: nil)// segue to feed view controller
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }
    
    //dismissing keyboard when user touches outside
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
