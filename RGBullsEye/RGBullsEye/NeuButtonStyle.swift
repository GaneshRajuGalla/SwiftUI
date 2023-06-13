//
//  NeuButtonStyle.swift
//  RGBullsEye
//
//  Created by Ganesh on 13/06/23.
//

import SwiftUI

struct NeuButtonStyle:ButtonStyle{
    let width:CGFloat
    let height: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.2 : 1)
            .frame(width: width,height: height)
            .background(
                Group{
                    if configuration.isPressed{
                        Capsule()
                            .fill(Color.element)
                            .southEastShadow()
                    }else{
                        Capsule()
                            .fill(Color.element)
                            .northWestShadow()
                    }
                }
            )
            .foregroundColor(Color(UIColor.systemBlue))
    }
}
