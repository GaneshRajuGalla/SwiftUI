//
//  ContentView.swift
//  PageableScrollView
//
//  Created by Ganesh on 11/08/23.
//

import SwiftUI
import SwiftUIIntrospect

struct PageableScrollView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 0){
                    ForEach(0..<50){ _ in
                        let randomGradientColors = [Color.random(), Color.random()]
                        RoundedRectangle(cornerRadius: 10)
                            .fill(RadialGradient(colors: randomGradientColors, center: .center, startRadius: 0, endRadius: proxy.size.width))
                        .frame(width: proxy.size.width)
                        .frame(maxHeight: .infinity)
                    }
                }
            }
            .ignoresSafeArea()
            .introspect(.scrollView, on: .iOS(.v13,.v14,.v15,.v16,.v17)) { scrollView in
                scrollView.isPagingEnabled = true
            }
        }
    }
}



extension Color {
    static func random() -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
