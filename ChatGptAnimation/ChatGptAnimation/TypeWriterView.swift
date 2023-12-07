//
//  TypeWriterView.swift
//  ChatGptAnimation
//
//  Created by Ganesh Raju Galla on 08/12/23.
//

import SwiftUI

struct TypeWriterView: View {
    
    // MARK: - Properties
    
    private let text:String
    private let speed:TimeInterval
    @Binding var isStarted:Bool
    @State private var textArray:String = ""
    
    init(_ text: String, speed: TimeInterval = 0.1, isStarted: Binding<Bool>) {
        self.text = text
        self.speed = speed
        self._isStarted = isStarted
    }
    
    // MARK: - Body
    
    var body: some View {
        Text(textArray)
            .onChange(of: isStarted) { _, _ in
                startAnimate()
            }
    }
}

// MARK: - TypeWriterView

extension TypeWriterView{
    
    // TODO: - startAnimate
    
    private func startAnimate(){
        DispatchQueue.global().async {
            let _ = text.map {
                Thread.sleep(forTimeInterval: speed)
                textArray += $0.description
            }
        }
    }
}
