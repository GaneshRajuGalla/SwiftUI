//
//  Enum.swift
//  CustomTabBar
//
//  Created by subinsjose on 29/01/24.
//

import Foundation

/// Enum representing different types of tabs in the application.
enum Tab {
    /// The home tab.
    case home
    
    /// The search tab.
    case search
    
    /// The notifications tab.
    case notifications
    
    /// The settings tab.
    case settings
    
    /// The title associated with the tab.
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .notifications:
            return "Notifications"
        case .settings:
            return "Settings"
        }
    }
    
    /// The system image name associated with the tab.
    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .notifications:
            return "bell"
        case .settings:
            return "gear"
        }
    }
}

