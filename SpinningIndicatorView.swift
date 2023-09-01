//
//  ContentView.swift
//  SpinningIndicator
//
//  Created by Ganesh on 03/06/23.
//

import SwiftUI

struct SpinningIndicatorView: View {
    // MARK: - Properties
    @State private var showSpinner:Bool = false
    @State private var degree:Int = 270
    @State private var spinnerLength = 0.6
    
    // MARK: - Body
    var body: some View {
        ZStack{
            VStack{
                Button {
                    showSpinner.toggle()
                } label: {
                    Text("Show Spinner")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .frame(width: 160)
                        .background(.linearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(8)
                        
                }
                .padding(20)
                if showSpinner{
                    Circle()
                        .trim(from: 0.0,to: spinnerLength)
                        .stroke(LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing),style: StrokeStyle(lineWidth: 8.0,lineCap: .round,lineJoin:.round))
                        .animation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true))
                        .frame(width: 60,height: 60)
                        .rotationEffect(Angle(degrees: Double(degree)))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        .onAppear{
                            degree = 270 + 360
                            spinnerLength = 0
                        }
                }
            }
        }
    }
}

