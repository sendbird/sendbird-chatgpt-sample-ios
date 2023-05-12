//
//  ChatGPTChannelViewController.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import UIKit
import SendbirdUIKit

class ChatGPTChannelViewController: SBUGroupChannelViewController {
    override func showChannelSettings() {
        guard let channel = self.channel else { return }
        
        let channelSettingsVC = SBUViewControllerSet.GroupChannelSettingsViewController.init(channel: channel)
        channelSettingsVC.listComponent = ChatBotChannelSettingModuleList()
        self.navigationController?.pushViewController(channelSettingsVC, animated: true)
    }
}
