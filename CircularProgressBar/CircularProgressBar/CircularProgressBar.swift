//
//  CircularProgressBar.swift
//  CircularProgressBar
//
//  Created by Ganesh on 02/07/23.
//

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
