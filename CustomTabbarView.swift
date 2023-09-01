//
//  ContentView.swift
//  CustomTabbar
//
//  Created by Ganesh on 17/05/23.
//

import SwiftUI

struct CustomTabbarView: View {
    
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State private var currentTab:Tab = .position
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab){
                Text(currentTab.rawValue)
                    .applyBG()
                    .tag(currentTab.rawValue)
            }
            CustomTabbar(currentTab: $currentTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbarView()
    }
}

struct CustomTabbar: View {
    @Binding var currentTab:Tab
    @State var yOffset:CGFloat = 0
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            HStack(spacing: 0) {
                ForEach(Tab.allCases,id: \.self){ tab in
                    Button {
                        withAnimation(.easeOut(duration: 0.2)){
                            currentTab = tab
                            yOffset = -60
                        }
                        
                        withAnimation(.easeOut(duration: 0.1).delay(0.07)){
                            yOffset = 0
                        }
                    } label: {
                        Image(systemName: getImage(rawValue: tab.rawValue))
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25,height: 25)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .green : .gray)
                            .scaleEffect(currentTab == tab ? 1.5 : 1)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment:.leading){
                Circle()
                    .fill(.white)
                    .frame(width: 50,height: 50)
                    .offset(x:10,y:yOffset)
                    .offset(x:indicatorOffset(width: width))
                    .shadow(color: .green, radius: 10)
            }
        }
        .frame(height: 30)
        .padding(.bottom,10)
        .padding([.horizontal,.top])
    }
    
    func indicatorOffset(width:CGFloat) -> CGFloat{
        let index = CGFloat(getIndex())
        if index == 0 {
            return 0
        }
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        return index * buttonWidth
    }
    
    func getIndex() -> Int{
        switch currentTab {
        case .home:
            return 0
        case .lable:
            return 1
        case .position:
            return 2
        case .found:
            return 3
        case .my:
            return 4
        }
    }
    
    func getImage(rawValue:String) -> String{
        switch rawValue {
        case "Home":
            return "house.fill"
        case "Label":
            return "list.clipboard.fill"
        case "Position":
            return "location.circle.fill"
        case "Found":
            return "safari.fill"
        case "My":
            return "person.crop.circle"
        default:
            return ""
        }
    }
}



extension View{
    func applyBG() -> some View{
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

enum Tab: String,CaseIterable{
    case home = "Home"
    case lable = "Label"
    case position = "Position"
    case found = "Found"
    case my = "My"
}

