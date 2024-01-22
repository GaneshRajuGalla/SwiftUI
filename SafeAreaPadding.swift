//
//  ContentView.swift
//  SafeAreaPadding
//
//  Created by Ganesh Raju Galla on 22/01/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var selectedTab:Tab = .padding
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack{
            
            VStack {
                
                // Picker
                Picker("Select Tab", selection: $selectedTab) {
                    ForEach(Tab.allCases,id: \.id){ itme in
                        Text(itme.rawValue.localizedUppercase)
                            .tag(itme)
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                
                // scrollView
                ScrollView(.horizontal,showsIndicators:false){
                    HStack(spacing: 10){
                        ForEach(0..<10){ _ in
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color.blue)
                                .frame(height: 250)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                }
                Spacer()
            }
            .if(selectedTab == .padding) { view in
                view.padding(.horizontal,10)
            }
            .if(selectedTab == .safeAreaPadding) { view in
                view.safeAreaPadding(.horizontal, 10)
            }
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}



#Preview {
    ContentView()
}

enum Tab:String, CaseIterable,Identifiable{
    case padding
    case safeAreaPadding
    var id:Tab{self}
}
