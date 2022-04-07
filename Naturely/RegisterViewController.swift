//
//  RegisterViewController.swift
//  Naturely
//
//  Created by Luis Mora on 4/6/22.
//

import UIKit

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
