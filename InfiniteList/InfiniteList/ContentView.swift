//
//  ContentView.swift
//  InfiniteList
//
//  Created by Ganesh on 30/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var items = Array(1...100)
    
    private var lastItem: Int? {
        items.last
    }
    
    var body: some View {
        List(items, id: \.self) { item in
            Text("Row:- \(item.description)")
                .onAppear {
                    updateItems(item: item)
                }
        }
    }
    
    private func updateItems(item: Int) {
        if let lastItem, lastItem == item {
            items += Array(lastItem...lastItem + 100)
        }
    }
}


#Preview {
    ContentView()
}
