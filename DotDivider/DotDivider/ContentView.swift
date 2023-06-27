//
//  ContentView.swift
//  DotDivider
//
//  Created by Ganesh on 28/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Line()
            .stroke(style: .init(dash: [20]))
            .foregroundStyle(.yellow)
            .frame(height: 1)
    }
}

#Preview {
    ContentView()
}


struct Line:Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
