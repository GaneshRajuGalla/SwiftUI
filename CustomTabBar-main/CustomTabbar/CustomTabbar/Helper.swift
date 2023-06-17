//
//  Tab.swift
//  CustomTabbar
//
//  Created by Ganesh on 17/05/23.
//

import SwiftUI

extension View{
    func applyBG() -> some View{
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

enum Tab: String,CaseIterable{
    case home = "Home"
    case lable = "Label"
    case position = "Position"
    case found = "Found"
    case my = "My"
}

