//
//  MacInsectCellView.swift
//  macOS-Cross-Platform
//
//  Created by Ganesh on 21/05/23.
//

import SwiftUI

struct MacInsectCellView: View {
    let insect:Insect
    var body: some View {
        HStack{
            Image(insect.imageName)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .clipShape(Rectangle())
                .frame(width: 160,height: 100)
            
            VStack(alignment: .leading) {
                Text(insect.name)
                    .font(.subheadline)
                Text(insect.habitat)
            }.padding(.vertical)
        }
    }
}

struct MacInsectCellView_Previews: PreviewProvider {
    static var previews: some View {
        MacInsectCellView(insect: testInsect)
    }
}
