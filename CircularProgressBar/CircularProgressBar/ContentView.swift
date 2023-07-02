//
//  ContentView.swift
//  CircularProgressBar
//
//  Created by Ganesh on 02/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var progressValue:Float = 0.1
    @State var color:Color = .blue
    
    var body: some View {
        VStack {
            CircularProgressBar(progress: $progressValue,color: $color)
                .frame(width: 150.0, height: 150.0)
                .padding(30)
            Button(action: {
                increaseProgress()
                randomColor()
            }, label: {
               Text("Click Me")
                    .bold()
                    .frame(width: 120,height: 40)
                    .foregroundStyle(.white)
                    .background(color.gradient)
                    .clipShape(.capsule)
                    .shadow(radius:5)
            })
        }
    }
    
    private func increaseProgress(){
        let randomValue = Float([0.012, 0.022, 0.034, 0.016, 0.11].randomElement()!)
        self.progressValue += randomValue
    }
    
    private func randomColor(){
        self.color = Color(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1))
    }
}

#Preview {
    ContentView()
}
