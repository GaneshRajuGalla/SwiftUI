//
//  DotLoader.swift
//  Loaders
//
//  Created by Ganesh Raju Galla on 23/01/24.
//

import SwiftUI

struct DotLoader: View {
    
    // MARK: - Properties
    let particleCount:Int = 8
    let radius:CGFloat = 20.0
    @State private var particles:[Particle] = []
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
            ForEach(particles){ particle in
                Circle()
                    .frame(width: 10,height: 10)
                    .offset(x: radius * CGFloat(cos(particle.angle * .pi/180)),y:radius * CGFloat(sin(particle.angle * .pi/180)))
                    .foregroundStyle(Color.orange)
            }
        }
        .onAppear{
            particles = (0..<particleCount).map{ index in
                Particle(id: UUID(), angle: Double(index) * (360.0 / Double(particleCount)))
            }
            
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                particles = particles.map{ particle in
                    Particle(id: particle.id, angle: particle.angle - 600.0)
                }
            }
        }
    }
}

#Preview {
    DotLoader()
        .preferredColorScheme(.dark)
}

struct Particle:Identifiable{
    let id:UUID
    let angle:Double
}
