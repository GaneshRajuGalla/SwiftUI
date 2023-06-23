//
//  ContentView.swift
//  TextFieldAlert
//
//  Created by Ganesh on 24/06/23.
//

import SwiftUI

struct ContentView: View{
    @State private var isPresented:Bool = false
    @State private var name:String = "Ganesh"
    var body: some View{
        VStack{
            Text(name)
                .font(.largeTitle)
                .padding(.vertical,20)
            Button("Edit"){
                isPresented = true
            }
            
            .alert("Edit Your Name", isPresented: $isPresented) {
                TextField(name, text: $name)
                Button("Save",action: {})
            }message: {
                Text("Please Enter your name to edit.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
