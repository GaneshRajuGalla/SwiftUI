//
//  ContentView.swift
//  TwitterButton
//
//  Created by Ganesh on 07/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 16,height: 16)
        }
        .buttonStyle(.twitterPostButton)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TwitterButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .frame(width: 60,height: 60)
            .background(.blue, in: Circle())
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
            .shadow(radius: 3)
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
            .padding(15)
    }
}

extension ButtonStyle where Self == TwitterButtonStyle{
    static var twitterPostButton: TwitterButtonStyle{
        .init()
    }
}
