//
//  BotTypeSelector.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import UIKit
import SendbirdUIKit

/// Please refer to ``ChatGPTChannelListViewController/botTypeSelector(_:didSelect:)``
protocol BotTypeSelectorDelegate: AnyObject {
    func botTypeSelector(_ botTypeSelect: BotTypeSelector, didSelectBot bot: ChatBot)
}

/// Please refer to ``ChatGPTChannelListViewController/loadChannelTypeSelector()``
/// ```swift
/// // SBUGroupChannelListViewController
/// override func loadChannelTypeSelector() {
///     if self.createChannelTypeSelector == nil {
///         let botTypeSelector = BotTypeSelector(delegate: self)
///         botTypeSelector.botSelectorDelegate = self
///         botTypeSelector.isHidden = true
///         self.createChannelTypeSelector = botTypeSelector
///     }
///     guard let createChannelTypeSelector else { return }
///     self.navigationController?.view.addSubview(createChannelTypeSelector)
/// }
/// ```
class BotTypeSelector: SBUCreateChannelTypeSelector {

    // MARK: - UI properties (Public)

    lazy var chatGPTBotButton: UIButton = {
        self.createButton(botType: .chatGPT)
    }()
    lazy var wittyBotButton: UIButton = {
        self.createButton(botType: .witty)
    }()
    lazy var knowledgeBotButton: UIButton = {
        self.createButton(botType: .knowledge)
    }()

    weak var botSelectorDelegate: BotTypeSelectorDelegate?

    // MARK: - View Lifecycle

    override func setupViews() {
        super.setupViews()
        
        self.selectorStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        self.selectorStackView.setHStack([
            self.chatGPTBotButton,
            self.wittyBotButton,
            self.knowledgeBotButton
        ])
    }

    override func setupStyles() {
        super.setupStyles()
        
        ChatBot.allCases.forEach { self.updateButton(botType: $0) }
    }

    override func setupLayouts() {
        super.setupLayouts()
        
        [self.chatGPTBotButton, self.wittyBotButton, self.knowledgeBotButton]
            .forEach { $0.sbu_constraint(height: 80) }
    }



    // MARK: - Actions

    @objc
    func onTapChatGPTBot() {
        self.botSelectorDelegate?.botTypeSelector(self, didSelectBot: .chatGPT)
    }

    @objc
    func onTapWittyBot() {
        self.botSelectorDelegate?.botTypeSelector(self, didSelectBot: .witty)
    }

    @objc
    func onTapKnowledgeBot() {
        self.botSelectorDelegate?.botTypeSelector(self, didSelectBot: .knowledge)
    }


    func createButton(botType: ChatBot) -> SBULayoutableButton {
        let button = SBULayoutableButton(gap: 4, labelAlignment: .under)
        button.setTitle(botType.name, for: .normal)
        button.setImage(UIImage(named: botType.imageName), for: .normal)
        switch botType {
        case .chatGPT:
            button.addTarget(
                self,
                action: #selector(onTapChatGPTBot),
                for: .touchUpInside
            )
        case .witty:
            button.addTarget(
                self,
                action: #selector(onTapWittyBot),
                for: .touchUpInside
            )
        case .knowledge:
            button.addTarget(
                self,
                action: #selector(onTapKnowledgeBot),
                for: .touchUpInside
            )
        }

        button.tag = botType.rawValue + 10
        button.setTitleColor(theme.channelTypeSelectorItemTextColor, for: .normal)
        button.titleLabel?.font = theme.channelTypeSelectorItemFont
        button.backgroundColor = self.theme.backgroundColor
        return button
    }

    func updateButton(botType: ChatBot) {
        guard let button = self.viewWithTag(botType.rawValue + 10) as? UIButton else { return }
        button.setImage(UIImage(named: botType.imageName), for: .normal)
        button.setTitleColor(theme.channelTypeSelectorItemTextColor, for: .normal)
        button.backgroundColor = self.theme.backgroundColor
    }

    override func updateButton(type: ChannelCreationType) {
        // do nothing
    }
}

