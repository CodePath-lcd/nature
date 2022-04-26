//
//  ChatListTableViewCell.swift
//  Naturely
//
//  Created by Ditry D'ateain on 4/25/22.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chatPhoto: UIImageView!
    @IBOutlet weak var chatNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
