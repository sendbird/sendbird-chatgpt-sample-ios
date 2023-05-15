//
//  ChatGPTChannelModule.List.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/15.
//

import UIKit
import SendbirdUIKit
import SendbirdChatSDK

class ChatGPTChannelModuleList: SBUGroupChannelModule.List {
    override func configureCell(_ messageCell: SBUBaseMessageCell, message: BaseMessage, forRowAt indexPath: IndexPath) {
        super.configureCell(messageCell, message: message, forRowAt: indexPath)
        
        switch messageCell {
        case let contentMessageCell as SBUContentBaseMessageCell:
            contentMessageCell.mainContainerView.layer.borderWidth = 1
            contentMessageCell.mainContainerView.layer.borderColor = SBUColorSet.onlight04.cgColor
        default: break
        }
    }
}
