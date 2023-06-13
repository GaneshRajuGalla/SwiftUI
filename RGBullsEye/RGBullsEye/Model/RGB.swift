//
//  RGB.swift
//  RGBullsEye
//
//  Created by Ganesh on 12/06/23.
//

import Foundation

struct RGB{
    
    var red =  0.5
    var green = 0.5
    var blue = 0.5
    
    static func random() -> RGB{
        var rgb = RGB()
        rgb.red = Double.random(in: 0..<1)
        rgb.green = Double.random(in: 0..<1)
        rgb.blue = Double.random(in: 0..<1)
        return rgb
    }
    
    func difference(target: RGB) -> Double{
        let rDiff = red - target.red
        let gDiff = red - target.green
        let bDiff = red - target.blue
        return sqrt((rDiff * rDiff + gDiff * gDiff + bDiff * bDiff) / 3.0)
    }
    
    func intString() -> String{
        "R: \(Int(red * 255.0))" + " G: \(Int(green * 255.0))" + " B: \(Int(blue * 255.0))"
    }
    
}

