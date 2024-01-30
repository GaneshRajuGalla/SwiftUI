//
//  TabButton.swift
//  CustomTabBar
//
//  Created by subinsjose on 29/01/24.
//

import SwiftUI

/// Represents a custom button view for a tab.
struct TabButton: View {
    /// The type of tab associated with the button.
    private let type: Tab
    
    /// Indicates whether the tab button is currently selected.
    private let isSelected: Bool
    
    /// A closure that is called when the button's animation finishes.
    private let didFinishAnimation: () -> Void
    
    /// Initializes a tab button view with the specified parameters.
    /// - Parameters:
    ///   - type: The type of tab associated with the button.
    ///   - isSelected: A Boolean value indicating whether the tab button is selected.
    ///   - didFinishAnimation: A closure to be called when the button's animation finishes.
    init(type: Tab,
         isSelected: Bool,
         didFinishAnimation: @escaping () -> Void) {
        self.type = type
        self.isSelected = isSelected
        self.didFinishAnimation = didFinishAnimation
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                didFinishAnimation()
            }
        }, label: {
            VStack(alignment: .center,
                   content: {
                Image(systemName: type.systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22)
                if isSelected {
                    Text(type.title)
                        .font(.system(size: 11))
                }
            })
        })
        .foregroundStyle(isSelected ? Color.primary : Color.secondary)
    }
}
