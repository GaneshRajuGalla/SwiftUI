//
//  ContentView.swift
//  MetalUIBG
//
//  Created by Ganesh on 18/06/23.
//

import SwiftUI
import MetalUI

struct MetalUIBGView: View {
    var body: some View {
        Image(uiImage: .girl)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .chromaKey(color: .init(red: 0, green: 1, blue: 0))
            .background(Image(uiImage: .background))
    }
}

