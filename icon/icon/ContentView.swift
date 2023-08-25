//
//  ContentView.swift
//  icon
//
//  Created by Ganesh on 25/08/23.
//

import SwiftUI

struct ContentView: View {
    let appIcons:[String] = ["AppIcon 1","AppIcon 2"]
    var body: some View {
        List{
            ForEach(appIcons,id: \.self) { name in
                Button {
                    UIApplication.shared.setAlternateIconName(name)
                } label: {
                    Text(name)
                        .fontWeight(.bold)
                }
            }
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
