//
//  User.swift
//  LoveSwipe
//
//  Created by Ganesh on 29/05/23.
//

import Foundation

struct User:Identifiable{
    var id = UUID().uuidString
    var name:String
    var place:String
    var profile:String
}
