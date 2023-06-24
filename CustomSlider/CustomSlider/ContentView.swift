//
//  ContentView.swift
//  CustomSlider
//
//  Created by Ganesh on 25/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var value:CGFloat = 0
    private var maxValue:CGFloat = 1
    var body: some View {
        VStack(spacing: 50) {
            CustomSlider(value: $value, maxValue: maxValue)
                .frame(height: 20)
            Slider(value: $value,in: 0...maxValue)
                //.opacity(0.5)
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    ContentView()
}
