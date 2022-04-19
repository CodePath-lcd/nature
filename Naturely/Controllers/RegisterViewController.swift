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
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //dismiss keyboard if user taps outside of textfield (the view controller itself)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }


    @IBAction func create_press(_ sender: Any) {
        let user = PFUser()
        
        user.username = username_textfield.text
        user.email = email_textfield.text
        user.password = password_textfield.text
        
        user["name"] = firstname_textfield.text
        user["surname"] = lastname_textfield.text
        
        //creating user object
        user.signUpInBackground {
            (success, error) in
            if success {
                // identifier was missing
                self.performSegue(withIdentifier: "welcome", sender: nil)// segue to feed view controller
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
                
                // replace with specific warnings for each field **
                self.warningLabel.text = "Please make sure all fields are complete."
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
