//
//  ContentView.swift
//  Cross-Platform
//
//  Created by Ganesh on 21/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var insectData: InsectData
    var body: some View {
        InsectListView{InsectDetailView(insect: $0) }
             .environmentObject(InsectData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(InsectData())
    }
}
