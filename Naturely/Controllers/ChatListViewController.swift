//
//  ChatListViewController.swift
//  Naturely
//
//  Created by Ditry D'ateain on 4/24/22.
//

import UIKit
import Parse


class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var chatList : [PFObject] = []
    
    let user = PFUser.current()!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.keyboardDismissMode = .interactive
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return chatList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatListTableViewCell
        
        return cell
    }
    
}
