//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Ganesh Raju Galla on 24/01/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var selectedTab:Tab = .home
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedTab,content:  {
                Group {
                    NavigationStack {
                        Home()
                    }
                    .tag(Tab.home)
                    
                    NavigationStack {
                        Search()
                    }
                    .tag(Tab.search)
                    
                    NavigationStack {
                        Notifications()
                    }
                    .tag(Tab.notifications)
                    
                    NavigationStack {
                        Settings()
                    }
                    .tag(Tab.settings)
                }
                .toolbar(.hidden, for: .tabBar)
            })
            
            VStack{
                Spacer()
                tabBar
            }
        }
    }
    
    private var tabBar: some View{
        HStack(content: {
            Spacer()
            
            // Home tab button
            TabButton(type: .home,
                      isSelected: selectedTab == .home) {
                selectedTab = .home
            }
    
            Spacer()
            
            // Search tab button
            TabButton(type: .search,
                       isSelected: selectedTab == .search) {
                selectedTab = .search
            }
            
            Spacer()
            
            // Notifications tab button
            TabButton(type: .notifications,
                      isSelected: selectedTab == .notifications) {
                selectedTab = .notifications
            }
    
            Spacer()
            
            // Settings tab button
            TabButton(type: .settings,
                      isSelected: selectedTab == .settings) {
                selectedTab = .settings
            }
            
            Spacer()
            
        })
        .padding()
        .frame(height: 72)
        .background {
            RoundedRectangle(cornerRadius: 36)
                .fill(RadialGradient(gradient: Gradient(colors: [.blue, .black]),
                                     center: .center,
                                     startRadius: 2,
                                     endRadius: 350))
                .shadow(color:Color.black.opacity(0.5),
                        radius: 8,
                        y:2)
        }
        .padding(.horizontal)
    }
}

struct Home: View {
    var body: some View {
        Text("Home")
    }
}

struct Search: View {
    var body: some View {
        Text("Search")
    }
}

struct Notifications:View {
    var body: some View {
        Text("Notifications")
    }
}

struct Settings: View {
    var body: some View {
        Text("Settings")
    }
}
