//
//  ContentView.swift
//  PhotosPickerSample
//
//  Created by Ganesh Raju Galla on 27/01/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var selectedPhotoItem:PhotosPickerItem? = nil
    @State private var image:UIImage? = nil
    
    
    // MARK: - Body
    
    var body: some View {
        VStack{
            if let image = image{
                VStack{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                    Spacer()
                }
            }else{
                Spacer()
            }
            
            PhotosPicker(selection: $selectedPhotoItem,matching: .images) {
                Text("Select Photo")
            }
            .photosPickerStyle(.inline)
            .photosPickerDisabledCapabilities(.search)
            .photosPickerAccessoryVisibility(.hidden)
            .frame(height: 200)
            .onChange(of: selectedPhotoItem) { oldValue, newValue in
                Task{
                    guard let imageData = try await selectedPhotoItem?.loadTransferable(type: Data.self) else {return}
                    guard let uiImage = UIImage(data: imageData) else {return}
                    image = uiImage
                }
            }
            .ignoresSafeArea(edges: [.bottom])
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
