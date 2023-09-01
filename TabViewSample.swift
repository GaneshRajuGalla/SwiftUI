//
//  ContentView.swift
//  TabView
//
//  Created by Ganesh on 25/06/23.
//

import SwiftUI

struct TabViewSample: View {
    var body: some View {
        TabView {
            Text("Home")
                .font(.title)
                .tabItem {
                    Label("Home", systemImage: "homekit")
                        .symbolEffect(.variableColor)
                }
                .badge(20)
            Text("List")
                .font(.title)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .badge(40)
            Text("Notifications")
                .font(.title)
                .tabItem {
                    Label("Notifications", systemImage: "text.bubble")
                }
                .badge(60)
            Text("Settings")
                .font(.title)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .badge(80)
        }
    }
}

