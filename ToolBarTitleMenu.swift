//
//  ContentView.swift
//  ToolBarTitleMenu
//
//  Created by Ganesh on 13/06/23.
//

import SwiftUI

struct ToolBarTitleMenu: View {
    @State private var title = "Title"
    var body: some View {
        NavigationStack{
            Text("ToolBarTitleMenu")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarTitleMenu {
                    ForEach(0..<8) { index in
                        Button {
                            title = "Title \(index)"
                        } label: {
                            Text("Title \(index)")
                    }
                }
            }
        }
    }
}


