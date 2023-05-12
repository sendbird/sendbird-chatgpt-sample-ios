//
//  ChatBotChannelSettingModule.List.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import UIKit
import SendbirdUIKit

class ChatBotChannelSettingModuleList: SBUGroupChannelSettingsModule.List {
    override func setupItems() {
        let notificationsItem = self.createNotificationItem()
        let membersItem = self.createMembersItem()
        let searchItem = self.createSearchItem()
        let leaveItem = self.createLeaveItem()
        
        self.items = SBUAvailable.isSupportMessageSearch()
        ? [notificationsItem, membersItem, searchItem, leaveItem]
        : [notificationsItem, membersItem, leaveItem]
    }
}
