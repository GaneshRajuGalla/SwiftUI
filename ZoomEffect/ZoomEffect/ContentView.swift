//
//  ContentView.swift
//  ZoomEffect
//
//  Created by Ganesh on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedImage:String?
    @Namespace private var nameSpace
    private let images = ["image-1","image-2","image-3","image-4","image-5","image-6","image-7","image-8","image-9","image-10","image-11","image-12","image-13","image-14","image-15","image-16","image-17","image-18","image-19","image-20","image-21"]
    private let columns:[GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        if let image = selectedImage{
            Image(image)
                .resizable()
                .frame(maxWidth:.infinity,maxHeight: .infinity)
                .onTapGesture {
                    withAnimation {
                        selectedImage = nil
                    }
                }
                .matchedGeometryEffect(id: selectedImage, in: nameSpace)
        }else{
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: columns) {
                    ForEach(images,id: \.self){ image in
                        Image(image)
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .cornerRadius(10)
                            .onTapGesture {
                                withAnimation {
                                    selectedImage = image
                                }
                            }
                            .matchedGeometryEffect(id: image, in: nameSpace)
                    }
                }
            }
            .padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
