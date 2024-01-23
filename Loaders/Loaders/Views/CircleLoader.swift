//
//  CircleLoader.swift
//  Loaders
//
//  Created by Ganesh Raju Galla on 23/01/24.
//

import SwiftUI

struct CircleLoader: View {
    
    // MARK: - Properties
    
    @State private var angle:Double = 0.0
    
    // MARK: - Body
    
    var body: some View {
        Circle()
            .trim(from: 0.1,to: 1.0)
            .stroke(style: StrokeStyle(lineWidth: 8,lineCap: .round,lineJoin: .round))
            .foregroundStyle(Color.orange)
            .rotationEffect(Angle(degrees: angle))
            .onAppear{
                withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                    angle = 360
                }
            }
    }
}

#Preview {
    CircleLoader()
        .preferredColorScheme(.dark)
}
