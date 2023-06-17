//
//  ContentView.swift
//  Timelapse
//
//  Created by Ganesh on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State var time = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            Image(systemName:"timelapse",variableValue: time)
                .imageScale(.large)
                .foregroundColor(.yellow)
                .font(.system(size: 200))
                .onReceive(timer) { value in
                    if time < 1.0{
                        time += 0.1
                    }else{
                        time = 0.0
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
