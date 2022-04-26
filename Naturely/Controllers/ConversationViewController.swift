//
//  ConversationViewController.swift
//  Naturely
//
//  Created by Ditry D'ateain on 4/24/22.
//

import UIKit
import MessageKit

struct Message: MessageType {
    
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
}

struct Sender: SenderType {
    
    var photoURL: String
    var senderId: String
    var displayName: String
    
}

class ConversationViewController: MessagesViewController {
    
    private var messages = [Message]()
    
    private let selfSender = Sender(photoURL: "", senderId: "1", displayName: "John")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("placeholder")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

    }
    
}

extension ConversationViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return selfSender
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

}
