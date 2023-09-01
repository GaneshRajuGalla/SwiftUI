//
//  ContentView.swift
//  ContentUnavailable
//
//  Created by Ganesh on 29/06/23.
//

import SwiftUI

struct ContentUnavailableView: View {
    @State private var ContentType:Int = 0
    var body: some View {
        VStack{
            Spacer()
            Picker("Content", selection: $ContentType) {
                Text("Search").tag(0)
                Text("Mail").tag(1)
                Text("Favourite").tag(2)
                Text("Weather").tag(3)
            }
            .pickerStyle(.segmented)
            switch ContentType{
            case 0:
                ContentUnavailableView.search
            case 1:
                ContentUnavailableView("No mails", systemImage: "tray.fill")
            case 2:
                ContentUnavailableView("No favourites",systemImage: "star")
                    .symbolVariant(.slash)
            case 3:
              
                ContentUnavailableView.init {
                    Label("Weather", systemImage: "cloud.rain")
                }description: {
                    Text("No weather data recorded")
                }actions: {
                    Button(action: {}, label: {
                        Label("Refresh",systemImage: "arrow.clockwise")
                    })
                }
            default:
                Text("Nothing")
            }
        }
        .padding()
       
    }
}

#Preview {
    ContentUnavailableView()
}
