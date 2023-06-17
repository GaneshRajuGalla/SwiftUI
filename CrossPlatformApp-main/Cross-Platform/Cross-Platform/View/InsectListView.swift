//
//  InsectListView.swift
//  Cross-Platform
//
//  Created by Ganesh on 21/05/23.
//

import SwiftUI

struct InsectListView<DetailView:View>: View {
    @EnvironmentObject var insectData: InsectData
    let detailViewProducer: (Insect) -> DetailView

    var body: some View {
        List{
            ForEach(insectData.insects){insect in
                NavigationLink(
                    destination: self.detailViewProducer(insect)
                        .environmentObject(self.insectData)){
                            InsectCellView(insect: insect)
                        }
            }
        }
    }
}

#if os(watchOS)
typealias PreviewDetailView = WatchInsectDetailView
#else
typealias PreviewDetailView = InsectDetailView
#endif

struct InsectListView_Previews: PreviewProvider {
    static var previews: some View {
        InsectListView{PreviewDetailView(insect:$0)}.environmentObject(InsectData())
    }
}
