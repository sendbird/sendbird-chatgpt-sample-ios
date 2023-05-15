//
//  ChatGPTChannelListViewController.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import UIKit
import SendbirdUIKit
import SendbirdChatSDK


/// ```swift
/// SBUViewControllerSet.GroupChannelListViewController = ChatGPTChannelListViewController.self
/// ```
class ChatGPTChannelListViewController: SBUGroupChannelListViewController, BotTypeSelectorDelegate, SBUCreateChannelViewModelDelegate {
    var createChannelViewModel: SBUCreateChannelViewModel?
    
    override func createViewModel(channelListQuery: GroupChannelListQuery?) {
        super.createViewModel(channelListQuery: channelListQuery)
        self.createChannelViewModel = SBUCreateChannelViewModel(delegate: self)
    }
    
    override func loadChannelTypeSelector() {
        if self.createChannelTypeSelector == nil {
            let botTypeSelector = BotTypeSelector(delegate: self)
            botTypeSelector.botSelectorDelegate = self
            botTypeSelector.isHidden = true
            self.createChannelTypeSelector = botTypeSelector
        }
        
        guard let createChannelTypeSelector else { return }
        self.navigationController?.view.addSubview(createChannelTypeSelector)
    }
    
    func botTypeSelector(_ botTypeSelect: BotTypeSelector, didSelectBot bot: ChatBot) {
        botTypeSelect.dismiss()
        createChannelViewModel?.createChannel(userIds: [bot.botID])
    }
    
    override func baseChannelListModule(_ headerComponent: SBUBaseChannelListModule.Header, didTapRightItem rightItem: UIBarButtonItem) {
        self.showCreateChannelTypeSelector()
    }
    
    // MARK: Create Channel
    func createChannelViewModel(_ viewModel: SBUCreateChannelViewModel, didCreateChannel channel: BaseChannel?, withMessageListParams messageListParams: MessageListParams?) {
        guard let channelURL = channel?.channelURL else { return }
        SendbirdUI.moveToChannel(channelURL: channelURL, messageListParams: messageListParams)
    }
    
    func createChannelViewModel(_ viewModel: SBUCreateChannelViewModel, didChangeUsers users: [SBUUser], needsToReload: Bool) { }
    
    func createChannelViewModel(_ viewModel: SBUCreateChannelViewModel, didUpdateSelectedUsers selectedUsers: [SBUUser]) { }
}
