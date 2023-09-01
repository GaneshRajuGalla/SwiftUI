//
//  ContentView.swift
//  DisplayMode
//
//  Created by Ganesh on 19/06/23.
//

import SwiftUI

struct DisplayModeView: View {
    @State private var displayMode:ToolbarTitleDisplayMode = .large
    @State private var selectedMode:Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<50) { index in
                        Text("Cell: \(index)")
                    }
                }
                .navigationTitle("List")
                .toolbarTitleDisplayMode(displayMode)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button(action: {
                                updateDisplayMode(0)
                            }) {
                                Text("Automatic")
                            }
                            
                            Button(action: {
                                updateDisplayMode(1)
                            }) {
                                Text("Inline")
                            }
                            
                            Button(action: {
                                updateDisplayMode(2)
                            }) {
                                Text("InlineLarge")
                            }
                            
                            Button(action: {
                                updateDisplayMode(3)
                            }) {
                                Text("Large")
                            }
                        } label: {
                            Label("Display Mode", systemImage: "gearshape")
                        }
                    }
                }
            }
        }
    }

    
    private func updateDisplayMode(_ selectedMode: Int) {
        switch selectedMode {
        case 0:
            displayMode = .automatic
        case 1:
            displayMode = .inline
        case 2:
            displayMode = .inlineLarge
        case 3:
            displayMode = .large
        default:
            break
        }
    }
}



#Preview {
    DisplayModeView()
}
