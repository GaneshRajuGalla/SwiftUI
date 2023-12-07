//
//  ContentView.swift
//  ChatGptAnimation
//
//  Created by Ganesh Raju Galla on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var isStarted:Bool = false
    private let input: String = """
                             SwiftUI is a UI framework developed by Apple that targets iOS, macOS, watchOS, and tvOS.
              
                             SwiftUI is aimed at building UIs in an easier and smarter way. SwiftUI allows you to write your UI declaratively and preview it in real time, making design and implementation efficient.
              
                             SwiftUI automatically generates a layout by simply declaring the UI elements (text, images, buttons, etc.) that make up the screen. SwiftUI also uses the application's auto-update feature to ensure that data changes are automatically reflected in the UI.
              
                             SwiftUI supports a large number of platforms, so you can use the same code to build apps for iOS, macOS, watchOS, and tvOS.
              
                             SwiftUI also makes it easy to implement features such as Accessibility, Dark Mode, and Localization.
              
                             SwiftUI allows you to build UIs in a more efficient and smart way, making it a very popular UI framework today.
              """
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isStarted.toggle()
                }
            }, label: {
                Text("Start")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Color.green.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
            })
            
            Spacer()
            
            TypeWriterView(input, speed: 0.1, isStarted: $isStarted)
            
        }
        .padding()
    }
}


#if DEBUG
#Preview {
    ContentView()
}
#endif


