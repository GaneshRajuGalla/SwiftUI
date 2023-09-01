//
//  AnimationView.swift
//  AnimationIndicator
//
//  Created by Ganesh on 10/06/23.
//

import SwiftUI

struct AnimationIndicatorView: View {
    @State private var isAnimating = false
    var body: some View {
        Circle()
            .trim(from: 0,to: 0.6)
            .stroke(AngularGradient(gradient: Gradient(colors: [.blue,.green]), center: .center),style: StrokeStyle(lineWidth: 8,lineCap: .round,dash: [0.1,16],dashPhase: 8))
            .frame(width: 48,height: 48)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .onAppear(){
                withAnimation(Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false)){
                    isAnimating.toggle()
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationIndicatorView()
    }
}
