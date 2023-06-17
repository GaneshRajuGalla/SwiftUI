//
//  Bulb.swift
//  StudyBuld
//
//  Created by Ganesh Raju Galla on 18/02/23.
//

import Foundation
import SwiftUI


//MARK: - Bulb
struct Bulb{
    
    //MARK: - Properties
    @ObservedObject var control:BulbControl
    
    //MARK: - Cord
    var cord:some View{
        Color.gray
            .frame(width: max(min(300/control.length, 5), 0.8),height: max(80, min(UIScreen.main.bounds.height * 0.6, control.length)))
    }
    
    //MARK: - Bulb Shape
    var bulb:some View{
        Image("bulb")
            .renderingMode(control.bulbState == .on ? .template : .original)
            .resizable()
            .foregroundColor(control.bulbColor)
            .frame(width: 45,height: 45)
            .offset(y: -5)
    }
    
    //MARK: - Bulb Shade
    @ViewBuilder
    var bulbShade:some View{
        if control.bulbState == .on{
            RadialGradient(gradient: Gradient(colors:[control.bulbColor.opacity(0.9),control.bulbColor.opacity(0.9),control.bulbColor.opacity(0.6),control.bulbColor.opacity(0.5),control.bulbColor.opacity(0.4),control.bulbColor.opacity(0.2),control.bulbColor.opacity(0.1),.clear]), center: .center, startRadius: 20, endRadius: 250)
                .frame(width: 350,height: 350)
                .mask(Circle())
                .clipped()
                .blendMode(.color)
        }
    }
    
}
