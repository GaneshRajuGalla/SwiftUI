//
//  Color.swift
//  RGBullsEye
//
//  Created by Ganesh on 12/06/23.
//

import Foundation
import SwiftUI

extension Color{
    init(regStruct rgb: RGB){
        self.init(red: rgb.red,green: rgb.green,blue: rgb.blue)
    }
    
    static let element = Color("Element")
    static let highlight = Color("Highlight")
    static let shadow = Color("Shadow")
}
