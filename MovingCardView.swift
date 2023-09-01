//
//  ContentView.swift
//  MovingCard
//
//  Created by Ganesh on 19/08/23.
//

import SwiftUI

struct MovingCardView: View {

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


struct CardView: View {
    let card:Card
    var body: some View {
        VStack{
            Spacer()
            Text(card.name)
                .font(.system(size: 20,weight: .ultraLight,design: .rounded))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .center)
            Spacer()
            Text(card.number)
                .font(.system(size: 23,weight: .medium,design: .monospaced))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .center)
            Spacer()
            Text(card.expire)
                .font(.system(size: 17,weight: .ultraLight,design: .rounded))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.all,20)
        }
    }
}




struct GlassmorphismButtonStyle:ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 10))
            .overlay(.white.opacity(0.5),in:RoundedRectangle(cornerRadius: 10).stroke(style: .init()))
    }
}

extension ButtonStyle where Self == GlassmorphismButtonStyle{
    static var glassmorphism:GlassmorphismButtonStyle{
        .init()
    }
}

struct Card{
    let name: String
    let number: String
    let expire: String
}


