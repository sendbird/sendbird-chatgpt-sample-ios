//
//  AppDelegate.swift
//  ChatGPTExample
//
//  Created by Jaesung Lee on 2023/05/12.
//

import UIKit
import SendbirdUIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        SendbirdUI.initialize(applicationId: "BDD627AC-AC88-45F4-B277-2B3B5C4610E3") { error in
            if let error { print(error.localizedDescription) }
        }
        SBUGlobals.currentUser = SBUUser(userId: "j_sung_0o0")
        
        // MARK: Customizations
        self.updateViewControllerSet()
        self.updateStringSet()
        self.updateTheme()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = SBUViewControllerSet.GroupChannelListViewController.init()
        let navigationController = UINavigationController.init(rootViewController: viewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func updateViewControllerSet() {
        SBUViewControllerSet.GroupChannelListViewController = ChatGPTChannelListViewController.self
        SBUViewControllerSet.GroupChannelViewController = ChatGPTChannelViewController.self
        SBUViewControllerSet.GroupChannelSettingsViewController = ChatGPTChannelSettingsViewController.self
        SBUViewControllerSet.GroupUserListViewController = ChatGPTUserListViewController.self
    }
    
    func updateStringSet() {
        SBUStringSet.CreateChannel_Header_Title = "Channel type"
    }
    
    func updateTheme() {
        let messageCellTheme = SBUMessageCellTheme(
            leftBackgroundColor: SBUColorSet.background50,
            leftPressedBackgroundColor: SBUColorSet.background100
        )
        SBUTheme.messageCellTheme = messageCellTheme
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
    }
}
