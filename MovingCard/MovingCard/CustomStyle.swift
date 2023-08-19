//
//  CustomStyle.swift
//  MovingCard
//
//  Created by Ganesh on 19/08/23.
//

import Foundation
import SwiftUI

struct GlassmorphismButtonStyle:ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 10))
            .overlay(.white.opacity(0.5),in:RoundedRectangle(cornerRadius: 10).stroke(style: .init()))
    }
}

extension ButtonStyle where Self == GlassmorphismButtonStyle{
    static var glassmorphism:GlassmorphismButtonStyle{
        .init()
    }
}
