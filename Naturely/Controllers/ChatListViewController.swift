//
//  ChatListViewController.swift
//  Naturely
//
//  Created by Ditry D'ateain on 4/24/22.
//

import UIKit
import Parse


class ChatListViewController: UIViewController {
    
//    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    @IBOutlet weak var snowImage: UIImageView!
    @IBOutlet weak var hike: UIImageView!
    @IBOutlet weak var lake: UIImageView!
    @IBOutlet weak var cows: UIImageView!
    @IBOutlet weak var water: UIImageView!
    
    
    
    
    var chatList : [PFObject] = []
    
    let user = PFUser.current()!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.delegate = self
//        tableView.dataSource = self
//
//        tableView.keyboardDismissMode = .interactive
//
        
        /////////////////////////////////////////
        snowImage.layer.borderWidth = 1
        snowImage.layer.masksToBounds = false
        snowImage.layer.borderColor = UIColor.black.cgColor
        snowImage.layer.cornerRadius = snowImage.frame.height/2
        snowImage.clipsToBounds = true
        
        hike.layer.borderWidth = 1
        hike.layer.masksToBounds = false
        hike.layer.borderColor = UIColor.black.cgColor
        hike.layer.cornerRadius = hike.frame.height/2
        hike.clipsToBounds = true
        
        lake.layer.borderWidth = 1
        lake.layer.masksToBounds = false
        lake.layer.borderColor = UIColor.black.cgColor
        lake.layer.cornerRadius = lake.frame.height/2
        lake.clipsToBounds = true
        
        cows.layer.borderWidth = 1
        cows.layer.masksToBounds = false
        cows.layer.borderColor = UIColor.black.cgColor
        cows.layer.cornerRadius = cows.frame.height/2
        cows.clipsToBounds = true
        
        water.layer.borderWidth = 1
        water.layer.masksToBounds = false
        water.layer.borderColor = UIColor.black.cgColor
        water.layer.cornerRadius = water.frame.height/2
        water.clipsToBounds = true
    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//       return 1
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//        return chatList.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatListTableViewCell
//
//        return cell
//    }
//
}
