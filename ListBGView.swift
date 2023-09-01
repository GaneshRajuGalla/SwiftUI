//
//  ContentView.swift
//  ListBG
//
//  Created by Ganesh on 30/06/23.
//

import SwiftUI

struct ListBGView: View {
    var body: some View {
        List {
            ForEach(0..<10){ index in
                Text("Index: \(index)")
                    .font(.title)
                    .frame(height: 30)
            }
        }
        .scrollContentBackground(.hidden)
        .background(.blue.gradient.opacity(0.5))
    }
}

