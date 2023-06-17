//
//  ContentView.swift
//  ColorClock
//
//  Created by Ganesh Raju Galla on 19/02/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var hoursAngle:Double = 0
    @State private var minutesAngle:Double = 0
    let timer = Timer.publish(every: 1.0, on: .main, in: .default).autoconnect()
    private let fullCircleValue: Double = 0.2
    
    //MARK: - Body
    var body: some View {
        ZStack{
            LinearGradient(colors: [.AppGray,.AppBlack], startPoint: .topLeading, endPoint: .bottom)
            bodyView
        }
        .ignoresSafeArea()
        .onReceive(timer) { time in
            withAnimation(.linear(duration: 1)) {
                minutesAngle += 360 / (fullCircleValue*60)
                hoursAngle += 360 / (fullCircleValue*60*12)
            }
        }
    }
}

//MARK: - Extension
extension ContentView{
    
    //MARK: - Body View
    var bodyView: some View{
        VStack{
            ClockView
        }
        .padding(.vertical,100)
    }
    
    //MARK: - ClockView
    private var ClockView:some View{
        ZStack{
            
            Circle()
                .stroke(lineWidth: 20)
                .fill(LinearGradient(colors: [.AppGray,.AppBlack], startPoint: .top, endPoint: .bottom))
                .blur(radius: 16)
                .shadow(color: .AppBlack, radius: 23,x: 0,y: 25)
                .shadow(color: .AppGray, radius: 23,x: 0,y: -25)
                .frame(width: 330,height: 330,alignment: .center)
            
            Circle()
                .fill(LinearGradient(colors: [.AppGray,.AppBlack].reversed(), startPoint: .top, endPoint: .bottom))
                .blur(radius: 3)
                .shadow(color: .AppGray, radius: 3,x: 0,y: -3)
                .shadow(color: .AppBlack, radius: 3,x: 0,y: 3)
                .frame(width: 13,height: 13,alignment: .center)
            
                HandsView
                .shadow(color: .AppBlack, radius: 10,x: 7,y: 10)
        }
    }
    
    //MARK: HandsView
    private var HandsView: some View{
        Canvas{ context ,size in
            context.addFilter(.alphaThreshold(min: 0.5,color: .AppGreen))
            context.addFilter(.blur(radius: 2))
            
            context.drawLayer { ctx in
                let hour = ctx.resolveSymbol(id: 1)!
                let minute = ctx.resolveSymbol(id: 2)!
                
                ctx.draw(hour, at: CGPoint(x: size.width/2, y: size.height/2))
                ctx.draw(minute, at: CGPoint(x: size.width/2, y: size.height/2))
            }
        }symbols: {
            HoursHandView
                .rotationEffect(.degrees(-90))
                .tag(1)
            
            MinutesHandView
                .rotationEffect(.degrees(-90))
                .tag(2)
        }
    }
    
    //MARK: - HoursHandView
    private var HoursHandView: some View{
        Capsule(style: .continuous)
            .fill(LinearGradient(colors: [.AppGreen,.AppDark], startPoint: .leading, endPoint: .trailing))
            .frame(width: 60,height: 13,alignment: .center)
            .offset(x: 50)
            .rotationEffect(.degrees(hoursAngle))
            .shadow(color: .AppBlack, radius: 10,x: -7,y: 5)
    }
    
    //MARK: - MinutesHandView
    private var MinutesHandView: some View{
        Capsule(style: .continuous)
            .fill(LinearGradient(colors: [.AppGreen,.AppDark], startPoint: .leading, endPoint: .trailing))
            .frame(width: 70,height: 7,alignment: .center)
            .offset(x: 55)
            .rotationEffect(.degrees(minutesAngle))
            .shadow(color: .AppBlack, radius: 10,x: -7,y: 5)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
