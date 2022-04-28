//
//  Message.swift
//  Naturely
//
//  Created by Luis Mora on 4/27/22.
//

import Foundation
import MessageKit

struct Message: MessageType {

    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind

}
