//
//  ContentView.swift
//  SwiftUITrails
//
//  Created by Ganesh on 03/09/23.
//

import SwiftUI

struct DynamicLoader: View {
    
    @State private var isLoading:Bool = false
    @State private var color:Color = .pink
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Circle()
                .trim(from: .zero,to: 0.6)
                .stroke(LinearGradient(colors: [color,.black.opacity(0.1)], startPoint: .leading, endPoint: .trailing),style: StrokeStyle(lineWidth: 8,lineCap: .round))
                .frame(width: 60,height: 60)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut) {
                isLoading = true
                color = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
            }
        }
    }
}

struct DynamicLoader_Previews: PreviewProvider {
    static var previews: some View {
        DynamicLoader()
    }
}
