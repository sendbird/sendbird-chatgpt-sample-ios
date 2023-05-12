//
//  ChatBot.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import Foundation

enum ChatBot: Int, CaseIterable {
    case chatGPT
    case witty
    case knowledge
    
    var botID: String {
        switch self {
        case .chatGPT:
            return "gpt_bot"
        case .witty:
            return "gpt_bot2"
        case .knowledge:
            return "gpt_bot3"
        }
    }
}
