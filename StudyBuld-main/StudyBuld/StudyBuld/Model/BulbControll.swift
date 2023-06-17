//
//  BulbControll.swift
//  StudyBuld
//
//  Created by Ganesh Raju Galla on 18/02/23.
//

import Foundation
import SwiftUI


//MARK: - BulbControl
class BulbControl:ObservableObject{
    
    //MARK: - Properties
    @Published var angle:Angle = .zero
    @Published var length:Double = 80
    @Published var bulbState:State = .on
    @Published var showBulbColorPicker:Bool = false
    @AppStorage("bulbColor") var bulbColor:Color = .yellow
    
    //MARK: - Functions
    func handleDragLocationChanged(to value:DragGesture.Value){
        //calculating the angle
        let dx = value.location.x - value.startLocation.x
        let dy = value.location.y + value.startLocation.y
        let angle = atan(dx/dy)
        let degree = -(angle * 180 / .pi)
        
        DispatchQueue.main.async{
            self.length = value.location.y
            self.angle = Angle(degrees: min(90, max(-90, degree)))
        }
    }
    
    func handleDragGestureEnd(){
        DispatchQueue.main.async{
            withAnimation(.spring(response:0.3,dampingFraction:0.35,blendDuration:0.8)){
                self.angle = .zero
                self.length = 80
            }
        }
    }
    
    func bulbOnOffState(){
        withAnimation(.easeOut(duration: 0.3)){
            self.bulbState.toggle()
        }
    }
    
}


//MARK:- State
enum State{
    case on,off
    
    mutating func toggle(){
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

