//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Ganesh on 12/06/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State var game = Game()
    @State var guess: RGB
    var taget = RGB.random()
    @State var showScore = false
    
    let circleSize:CGFloat = 0.275
    let labelHeight:CGFloat = 0.06
    let labelWidth:CGFloat = 0.53
    let buttonWidth:CGFloat = 0.87
    
    // MARK: Body
    var body: some View {
        GeometryReader{ proxy in
            ZStack{
                Color.element
                    .ignoresSafeArea(.all)
                VStack{
                    ColorCircle(rgb: game.target, size: proxy.size.height * circleSize)
                    
                    if !showScore{
                        BevelText(text: "R: ??? G: ??? B: ???", width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    }else{
                        BevelText(text: game.target.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    }
                    ColorCircle(rgb: guess, size: proxy.size.height * circleSize)
                    BevelText(text: guess.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                    Button {
                        showScore = true
                        game.check(guess: guess)
                    } label: {
                        Text("Hit Me!")
                            .font(.headline)
                    }
                    .buttonStyle(NeuButtonStyle(width: proxy.size.width * buttonWidth, height: proxy.size.height * labelHeight))
                    .alert(isPresented: $showScore) {
                        Alert(title: Text("Your Score"),message: Text(String(game.scoreRound)),dismissButton: .default(Text("OK")){
                            game.startNewRecord()
                            guess = RGB()
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView(guess: RGB())
        }
    }
}


