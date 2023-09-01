//
//  ContentView.swift
//  Clock
//
//  Created by Ganesh on 13/05/23.
//

import SwiftUI

struct ClockView: View {
    
    // MARK: Properties
    
    @State private var minute:Double = 0
    @State private var hour: Double = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.black)
                .frame(width: 8,height: 100)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke().fill(.white))
                .offset(y: -46)
                .rotationEffect(Angle.degrees(minute))
                .shadow(radius: 5,y: 5)
                .animation(.linear(duration: 10).repeatCount(12,autoreverses: false), value: minute)
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.black)
                .frame(width: 8,height: 70)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke().fill(.white))
                .offset(y: -32)
                .rotationEffect(Angle(degrees: hour))
                .shadow(radius: 5,y: 5)
                .animation(.linear(duration: 120), value: hour)
            
            Circle()
                .fill(.black)
                .frame(width: 3)
            
        }
        .onAppear{
            hour = 360
            minute = 360
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
