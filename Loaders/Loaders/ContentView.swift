//
//  ContentView.swift
//  Loaders
//
//  Created by Ganesh Raju Galla on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var loader:Loader = .circle
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Picker("Loader", selection: $loader) {
                ForEach(Loader.allCases, id: \.id){ loader in
                    Text(loader.rawValue.localizedUppercase)
                        .tag(loader)
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            switch loader {
            case .circle:
                CircleLoader()
                    .frame(width: 50,height: 50)
            case .dot:
                DotLoader()
                    .frame(width: 50,height: 50)
            case .bounce:
                BounceLoader()
                    .frame(width: 50,height: 50)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}


enum Loader:String,Identifiable,CaseIterable{
    case circle
    case dot
    case bounce
    var id:Loader{self}
}
