//
//  ContentView.swift
//  MovingCard
//
//  Created by Ganesh on 19/08/23.
//

import SwiftUI

struct ContentView: View {

    // Properties
    @State var card: Card = .init(name: "Master Card", number: "3610 7399 4823", expire: "2023/08/22")
    @State private var presentSheet:Bool = false
    @State var x:CGFloat = 0
    @State var y:CGFloat = 0

    // body
    var body: some View {
        ZStack{
            Image("back")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack{
                Button {
                    presentSheet.toggle()
                } label: {
                    CardView(card: card)
                        .frame(width: 320,height: 190)
                }
                .buttonStyle(.glassmorphism)
                .rotation3DEffect(Angle(degrees: 20), axis: (x: x, y: y, z: 0))
                Spacer()
            }
           
        }
        .gesture(gesture)
        .sheet(isPresented: $presentSheet) {
            cardList
        }
    }

    private var gesture: _EndedGesture<_ChangedGesture<DragGesture>> {
        DragGesture()
            .onChanged { value in
                withAnimation(.easeInOut){
                    self.x = value.startLocation.y - value.location.y
                    self.y = value.startLocation.x - value.location.x
                }
            }
            .onEnded { _ in
                withAnimation(.easeInOut){
                    self.x = 0
                    self.y = 0
                }
            }
    }
    
    private var cardList: some View{
        List{
            LabeledContent {
                Text(card.name)
            } label: {
                Text("Card Name")
            }
            
            LabeledContent {
                Text(card.number)
            } label: {
                Text("Card Number")
            }
            
            LabeledContent {
                Text(card.expire)
            } label: {
                Text("Expire Date")
            }
        }
        .listStyle(.insetGrouped)
        .presentationDetents([.medium])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

