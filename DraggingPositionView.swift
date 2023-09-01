//
//  ContentView.swift
//  DraggingPosition
//
//  Created by Ganesh on 04/07/23.
//

import SwiftUI

struct DraggingPositionView: View {
    var body: some View {
        ZStack{
            ForEach(FaceParts.allCases){
                DraggableView(location: $0.defaultLocation, imageName: $0.imageName)
            }
        }
    }
}

struct DraggingPositionView_Previews: PreviewProvider {
    static var previews: some View {
        DraggingPositionView()
    }
}


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


enum FaceParts:String,Identifiable,CaseIterable{
    
    case leftEye
    case rightEye
    case nose
    case mouth
    
    var id:String{rawValue}
    
    var imageName:String{
        switch self {
        case .leftEye:
            return "eye"
        case .rightEye:
            return "eye"
        case .nose:
            return "nose"
        case .mouth:
            return "mouth"
        }
    }
    
    var defaultLocation:CGPoint{
        switch self {
        case .leftEye:
            return CGPoint(x: 120, y: 200)
        case .rightEye:
            return CGPoint(x: 280, y: 200)
        case .nose:
            return CGPoint(x: 190, y: 300)
        case .mouth:
            return CGPoint(x: 190, y: 430)
        }
    }
}
