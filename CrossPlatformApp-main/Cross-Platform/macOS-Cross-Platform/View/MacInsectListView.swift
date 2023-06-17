//
//  MacInsectListView.swift
//  macOS-Cross-Platform
//
//  Created by Ganesh on 21/05/23.
//

import SwiftUI

struct MacInsectListView: View {
    @EnvironmentObject var insectData:InsectData
    @Binding var selectedInsect:Insect?
    var body: some View {
        List(selection: $selectedInsect) {
            ForEach(insectData.insects){ insect in
                MacInsectCellView(insect: insect)
                    .tag(insect)
            }
        }.listStyle(.sidebar)
    }
}

struct MacInsectListView_Previews: PreviewProvider {
    static var previews: some View {
        MacInsectListView(selectedInsect: .constant(testInsect))
            .environmentObject(InsectData())
    }
}
