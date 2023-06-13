//
//  Game.swift
//  RGBullsEye
//
//  Created by Ganesh on 12/06/23.
//

import Foundation

struct Game{
    let start = RGB()
    var target = RGB.random()
    var round = 1
    var scoreRound = 0
    var scoreTotal = 0
    
    mutating func check(guess: RGB){
        let difference = lround(guess.difference(target: target) * 100.0)
        scoreRound = 100 - difference
        if difference == 0{
            scoreRound += 100
        }else if difference == 1{
            scoreRound += 50
        }
        scoreTotal += scoreRound
    }
    
    mutating func startNewRecord(){
        round += 1
        scoreRound = 0
        target = RGB.random()
    }
    
    mutating func startNewGame(){
        round = 0
        scoreTotal = 0
        startNewRecord()
    }
}
