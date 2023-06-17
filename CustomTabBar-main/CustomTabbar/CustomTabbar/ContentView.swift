//
//  ContentView.swift
//  CustomTabbar
//
//  Created by Ganesh on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State private var currentTab:Tab = .position
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab){
                Text(currentTab.rawValue)
                    .applyBG()
                    .tag(currentTab.rawValue)
            }
            CustomTabbar(currentTab: $currentTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
