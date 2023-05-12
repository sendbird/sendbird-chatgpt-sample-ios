//
//  ChatGPTUserListModule.List.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import UIKit
import SendbirdUIKit

class ChatGPTUserListModuleList: SBUUserListModule.List {
    override func configureCell(_ cell: UITableViewCell?, indexPath: IndexPath) {
        super.configureCell(cell, indexPath: indexPath)
        guard let defaultCell = cell as? SBUUserCell else { return }
        defaultCell.moreButton.isHidden = true
    }
}
