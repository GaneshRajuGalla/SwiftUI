//
//  ColorSlider.swift
//  RGBullsEye
//
//  Created by Ganesh on 12/06/23.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value:Double
    var trackColor: Color
    var body: some View {
        HStack{
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .font(.subheadline)
        .padding(.horizontal)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(0.5), trackColor: .red)
    }
}
