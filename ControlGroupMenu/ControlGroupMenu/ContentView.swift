//
//  ContentView.swift
//  ControlGroupMenu
//
//  Created by Ganesh on 15/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing:50){
            Menu {
                ControlGroup{
                    Button(action: {}, label: {
                        Image(systemName: "scissors")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "doc.on.doc")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "doc.on.clipboard")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "doc.text.magnifyingglass")
                    })
                }.controlGroupStyle(.compactMenu)
                
                Button(action: {}, label: {
                    Label("Translate", systemImage: "trash")
                })
                
                Button(action: {}, label: {
                    Label("share", systemImage: "square.and.arrow.up")
                })
            } label: {
                Text("Menu 1")
            }
            
            Menu {
                ControlGroup{
                    Button(action: {}, label: {
                        Label("Cut", systemImage: "scissors")
                    })
                    
                    Button(action: {}, label: {
                        Label("Copy", systemImage: "doc.on.doc")
                    })
                    
                    Button(action: {}, label: {
                        Label("Paste", systemImage: "doc.on.clipboard")
                    })
                }.controlGroupStyle(.menu)
                
                Button(action: {}, label: {
                    Label("Look Up", systemImage: "doc.text.magnifyingglass")
                })
                
                Button(action: {}, label: {
                    Label("Translate", systemImage: "text.bubble")
                })
                
                Button(action: {}, label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                })
                
            } label: {
                Text("Menu 2")
            }


        }
    }
}


#Preview {
    ContentView()
}
