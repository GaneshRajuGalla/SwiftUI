//
//  CardView.swift
//  MovingCard
//
//  Created by Ganesh on 19/08/23.
//

import SwiftUI

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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(name: "Member Ship", number: "12345", expire: "22/06/222"))
            .previewLayout(.sizeThatFits)
    }
}
