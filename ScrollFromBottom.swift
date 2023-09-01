//
//  ContentView.swift
//  ScrollFromBottom
//
//  Created by Ganesh on 02/08/23.
//



import SwiftUI

struct ScrollFromBottom: View {
    @State private var items: [Int] = Array(0..<50)

    var body: some View {
        NavigationView {
            ScrollView {
                ScrollViewReader { proxy in
                    VStack(spacing: 10) {
                        ForEach(items, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .foregroundColor(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                                .id(index)
                        }
                    }
                    .padding(12)
                    .onChange(of: items.count) { _ in
                        DispatchQueue.main.async {
                            withAnimation {
                                proxy.scrollTo(items.count - 1, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            .navigationBarItems(trailing:
                Button("Add Item") {
                    items.append(items.count)
                }
            )
            .navigationBarTitle(Text("ScrollFromBottom"))
        }
    }
}

