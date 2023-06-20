//
//  ContentView.swift
//  InsideShadow
//
//  Created by Ganesh on 21/06/23.
//

import SwiftUI

struct ContentView: View {
    private let baseColor:Color = .init(red: 232/255, green: 232/255, blue: 232/255)
    private let shadowColor:Color = .init(red: 197/255, green: 197/255, blue: 197/255)
    @State private var shadowStyle:ShadowStyle = .inner(radius: 8)
    @State private var selectedStyle:Int = 0
    
    var body: some View {
        VStack{
            Picker("Shadow", selection: $selectedStyle) {
                Text("Inner").tag(0)
                Text("Drop").tag(1)
            }
            .pickerStyle(.segmented)
            .onChange(of: selectedStyle, perform: { value in
                updateStyle()
            })
            .padding(.vertical,50)
            RoundedRectangle(cornerRadius: 20)
                 .fill(baseColor.gradient.shadow(shadowStyle))
                 .frame(width: 300,height: 300)
        }
        .padding()
    }
    
    private func updateStyle(){
        switch selectedStyle{
        case 0:
            shadowStyle = .inner(color: shadowColor,radius: 8 , x: 20,y: 20)
        case 1:
            shadowStyle = .drop(color:shadowColor,radius: 8,x: 20,y: 20)
        default:
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
