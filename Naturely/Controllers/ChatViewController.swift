//
//  ChatViewController.swift
//  Naturely
//
//  Created by Luis Mora on 4/18/22.
//

import UIKit

protocol ChatImageViewControllerDelegate: AnyObject {
    func imageSelected(controller: ChatViewController)
}

class ChatViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
