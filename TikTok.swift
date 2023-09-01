//
//  ContentView.swift
//  TikTok
//
//  Created by Ganesh on 29/08/23.
//

import SwiftUI

struct TikTok: View{
    
    @State private var isglitch:Bool = false
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    private let symbol = """
          ⠀⠀⠀⠀⠀⠀⠀⠀⣶⣶⣶⡀⠀⠀
          ⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⣄⣀
          ⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿
          ⠀⠀⢀⣠⣴⣶⣶⠀⣿⣿⣿⠉⠉⠉
          ⠀⣴⣿⣿⣿⣿⣿⠀⣿⣿⣿⠀⠀⠀
          ⢸⣿⣿⡿⠉⠀⠈⠀⣿⣿⣿⠀⠀⠀
          ⢹⣿⣿⣷⡀⠀⠀⣰⣿⣿⣿⠀⠀⠀
          ⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀
          ⠀⠀⠙⠻⠿⠿⠿⠿⠋⠁⠀⠀⠀⠀
        """
    
    private let text = "TikTok"
    
    private let offsetRange = -10...10
    
    var body: some View{
        ZStack{
            VStack(spacing: 10){
                Text(symbol)
                    .font(.system(size: 20).bold())
                Text(text)
                    .font(.system(size: 80).bold())
            }
            .foregroundColor(.pink)
            .offset(x: isglitch ? CGFloat(Int.random(in: offsetRange)) : 0, y: isglitch ? CGFloat(Int.random(in: offsetRange)): 0)
            
            VStack(spacing: 10){
                Text(symbol)
                    .font(.system(size: 20).bold())
                Text(text)
                    .font(.system(size: 80).bold())
            }
            .foregroundColor(.cyan)
            .offset(x: isglitch ? CGFloat(Int.random(in: offsetRange)) : 0, y: isglitch ? CGFloat(Int.random(in: offsetRange)) : 0)
            
            VStack(spacing: 10){
                Text(symbol)
                    .font(.system(size: 20).bold())
                Text(text)
                    .font(.system(size: 80).bold())
            }
            .preferredColorScheme(.dark)
            .onReceive(timer) { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0...0.1)){
                    self.isglitch.toggle()
                }
            }
            
            .onDisappear{
                self.timer.upstream.connect().cancel()
            }
        }
    }
}


