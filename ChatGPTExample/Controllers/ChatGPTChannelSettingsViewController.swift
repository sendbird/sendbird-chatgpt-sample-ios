//
//  ChatGPTChannelSettingsViewController.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import UIKit
import SendbirdUIKit

/// ```swift
/// SBUViewControllerSet.GroupChannelSettingsViewController = ChatGPTChannelSettingsViewController.self
/// ```
/// Refer to ``AppDelegate/updateViewControllerSet()``
class ChatGPTChannelSettingsViewController: SBUGroupChannelSettingsViewController {
    override func showMemberList() {
        guard let channel = self.channel else { return }
        let memberListVC = SBUViewControllerSet.GroupUserListViewController.init(
            channel: channel,
            userListType: .members
        )
        memberListVC.listComponent = ChatGPTUserListModuleList()
        self.navigationController?.pushViewController(memberListVC, animated: true)
    }
}
