//
//  DraggableView.swift
//  DraggingPosition
//
//  Created by Ganesh on 04/07/23.
//

import SwiftUI

struct DraggableView:View{
    
    @State private var isDragging:Bool = false
    @State private var location:CGPoint
    
    private let imageName:String
    
    init(location:CGPoint,imageName:String){
        self.location = location
        self.imageName = imageName
    }
    
    var dragGesture: some Gesture{
        DragGesture()
            .onChanged { value in
                self.location = value.location
                self.isDragging = true
            }
        
            .onEnded { _ in
                self.isDragging = false
            }
    }
    
    var body: some View{
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 100)
            .foregroundColor(isDragging ? .blue : .black)
            .position(location)
            .gesture(dragGesture)
    }
}
