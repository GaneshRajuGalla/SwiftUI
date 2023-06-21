//
//  ContentView.swift
//  RandomColor
//
//  Created by Ganesh on 22/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 20, content: {
                ForEach(0..<100,id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1)).gradient)
                        .frame(maxWidth: .infinity)
                        .frame(height: 110)
                        .scrollTransition { view, transition in
                            view.rotation3D(.degrees(transition.isIdentity ? 0 : 60), axis: (x: -1, y: 1, z: 0),perspective: 0.5)
                                .rotationEffect(.degrees(transition.isIdentity ? 0 : -30))
                                .offset(x:transition.isIdentity ? 0 : -200)
                                .blur(radius: transition.isIdentity ? 0 : 10)
                                .scaleEffect(transition.isIdentity ? 1 : 0.8)
                        }
                }
            })
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
