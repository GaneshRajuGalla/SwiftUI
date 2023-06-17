//
//  Cross_PlatformApp.swift
//  Cross-Platform
//
//  Created by Ganesh on 21/05/23.
//

import SwiftUI

@main
struct Cross_PlatformApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(InsectData())
        }
    }
}
