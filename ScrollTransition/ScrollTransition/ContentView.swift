//
//  ContentView.swift
//  ScrollTransition
//
//  Created by Ganesh on 16/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 10){
                ForEach(1..<30,id: \.self){ index in
                    Text("Cell \(index)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .overlay(.white.opacity(0.5), in: RoundedRectangle(cornerRadius: 10).stroke(style: .init()))
                        .padding(.horizontal,20)
                        .scrollTransition { emptyVisualEffect, scrollTransitionPhase in
                            emptyVisualEffect.scaleEffect(scrollTransitionPhase.isIdentity ? 1 : 0.8)
                        }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [.pink, .green,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    ContentView()
}
