//
//  ContentView.swift
//  ScrollPaging
//
//  Created by Ganesh on 20/06/23.
//

import SwiftUI

struct ScrollPaging: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach(0..<50, id: \.self){ index in
                    Text("Page: \(index)")
                        .font(.title)
                        .foregroundStyle(.white)
                        .frame(maxHeight: .infinity)
                        .frame(width: UIScreen.main.bounds.width - 45)
                        .background(LinearGradient(colors: [.color,.color1], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(20)
                        .padding(20)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    //ScrollPaging()
    VerticalScroll()
}


struct VerticalScroll:View {
    var body: some View {
        ScrollView(.vertical){
            VStack{
                ForEach(0..<50,id: \.self){ index in
                    Text("Page: \(index)")
                        .font(.title)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: UIScreen.main.bounds.height - 125)
                        .background(LinearGradient(colors: [.color,.color1], startPoint: .topLeading, endPoint: .bottomTrailing))
                        
                        .cornerRadius(20)
                        .padding(20)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
    }
}
