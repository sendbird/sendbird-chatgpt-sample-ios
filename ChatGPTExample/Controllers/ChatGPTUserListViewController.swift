//
//  ChatGPTUserListViewController.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import UIKit
import SendbirdUIKit

class ChatGPTUserListViewController: SBUUserListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerComponent?.rightBarButton = nil
    }
}
