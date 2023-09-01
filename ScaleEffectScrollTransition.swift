//
//  ContentView.swift
//  ScaleEffectScrollTransition
//
//  Created by Ganesh on 17/06/23.
//

import SwiftUI

struct ScaleEffectScrollTransition: View {
    let cellColors: [Color] = [.red, .blue, .green, .orange, .purple]
    var body: some View {
        ScrollView(.vertical) {
            ForEach(0..<50) { index in
                let randomColor = cellColors.randomElement() ?? .red
                let gradient = LinearGradient(gradient: Gradient(colors: [.black, randomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
                Text("Cell: \(index)")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .foregroundColor(.white)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(gradient)
                                .shadow(color: .black, radius: 10)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .opacity(0.5)
                                .blur(radius: 5)
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1)
                        }
                    )
                    .padding(.horizontal, 20)
                    .scrollTransition(topLeading: .animated, bottomTrailing: .animated) { view, transition in
                        view.rotationEffect(.radians(transition.value))
                    }
            }
        }
    }
}

