//
//  FaceParts.swift
//  DraggingPosition
//
//  Created by Ganesh on 05/07/23.
//

import Foundation

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
