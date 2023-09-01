//
//  ContentView.swift
//  ScrollTransitions
//
//  Created by Ganesh on 16/06/23.
//

import SwiftUI

struct ScrollTransitionsView: View {
    var body: some View {
        ScrollView{
            ForEach(0..<20,id: \.self){_ in
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(colors: [.color1,.color2,.color3], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(color: .color3, radius: 10)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .padding(5)
                        .overlay(
                            Image(uiImage: .visionPro)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 10)
                        )
                }
                .padding(.horizontal,20)
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                    .scrollTransition { View, transition in
                        View.opacity(transition.isIdentity
                                     ? 1 : 0.3)
                    }
            }
        }
    }
}

#Preview {
    ScrollTransitionsView()
}
