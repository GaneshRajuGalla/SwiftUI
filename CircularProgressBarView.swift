//
//  ContentView.swift
//  CircularProgressBar
//
//  Created by Ganesh on 02/07/23.
//

import SwiftUI

struct CircularProgressBarView: View {
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
    CircularProgressBarView()
}


import SwiftUI

struct CircularProgressBar: View {
    @Binding var progress:Float
    @Binding var color:Color
    var body: some View {
        ZStack{
           Circle()
                .stroke(lineWidth: 24.0)
                .opacity(0.3)
                .foregroundStyle(color)
            
            Circle()
                .trim(from: 0.0,to:CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 24,lineCap: .round,lineJoin: .round))
                .foregroundStyle(color.gradient)
                .rotationEffect(Angle(degrees: 270.0))
            
            Text(String(format: "%.0f %%", min(progress, 1.0) * 100.0))
                .font(.largeTitle)
                .bold()
        }
    }
}

#Preview {
    CircularProgressBar(progress: .constant(0.3), color: .constant(.purple))
}
