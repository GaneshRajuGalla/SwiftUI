//
//  FidgetSpinnerView.swift
//  FidgetSpinner
//
//  Created by Ganesh on 01/09/23.
//

import SwiftUI

struct FidgetSpinnerView: View {
    @State private var angle: Double = 0
    @State private var acceleration: Double = 0

    private let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.pink, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .mask(
                    Image(systemName: "snowflake")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .rotationEffect(.degrees(angle))
                )
                .frame(width: 300, height: 300)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            acceleration += value.translation.height / 10
                        }
                )
                .foregroundColor(.pink)
                .onReceive(timer) { _ in
                    acceleration += (acceleration * 0.01)
                    angle += acceleration
                }
            }
        }
    }
}


struct FidgetSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        FidgetSpinnerView()
    }
}
