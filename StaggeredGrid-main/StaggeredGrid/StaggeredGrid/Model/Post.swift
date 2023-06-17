//
//  Post.swift
//  StaggeredGrid
//
//  Created by Ganesh on 14/05/23.
//

import SwiftUI

struct Post: Identifiable,Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
