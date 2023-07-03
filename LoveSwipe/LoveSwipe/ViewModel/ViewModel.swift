//
//  ViewModel.swift
//  LoveSwipe
//
//  Created by Ganesh on 29/05/23.
//

import Foundation
import SwiftUI

class ViewModel:ObservableObject{
    
    @Published var fetchedUsers:[User] = []
    @Published var displayedUser:[User]?
    
    init(){
        fetchedUsers = [User(name: "Elizabeth", place: "America", profile: "Elizabeth"),
                        User(name: "BlackWidow", place: "America", profile: "BlackWidow"),
                        User(name: "Gamora", place: "America", profile: "Gamora"),
                        User(name: "WonderWomen", place: "America", profile: "WonderWomen"),
                        User(name: "CaptainMarvel", place: "America", profile: "CaptainMarvel"),
                        User(name: "Mera", place: "America", profile: "Mera"),
                        User(name: "CatWomen", place: "America", profile: "CatWomen"),
                        User(name: "SuperWomen", place: "America", profile: "SuperWomen"),
                        User(name: "Hela", place: "America", profile: "Hela"),
                        User(name: "HuntsMan", place: "America", profile: "HuntsMan")
        ]
        displayedUser = fetchedUsers
    }
    
    func getIndex(user:User) -> Int{
        let index = displayedUser?.firstIndex(where: { currentUser in
            return user.id == currentUser.id
        }) ?? 0
        return index
    }
}
