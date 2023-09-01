//
//  ContentView.swift
//  Glassmorphism
//
//  Created by Ganesh on 18/08/23.
//

import SwiftUI

struct GlassmorphicStyle:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(.ultraThinMaterial.opacity(0.7),in:RoundedRectangle(cornerRadius: 10))
            .overlay(.white.opacity(0.5),in:RoundedRectangle(cornerRadius: 10).stroke(style: .init()))
    }
}

extension ButtonStyle where Self == GlassmorphicStyle {
    static var glassmorphism: GlassmorphicStyle {
        .init()
    }
}

struct GlassmorphismView: View {
    var body: some View {
        ZStack(alignment: .center){
            Image("apple")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Button {
                print("hello")
            } label: {
                Text("")
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
            }
            .padding(.horizontal,40)
            .buttonStyle(.glassmorphism)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GlassmorphismView()
    }
}
