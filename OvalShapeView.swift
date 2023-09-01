//
//  ContentView.swift
//  OvalShape
//
//  Created by Ganesh on 18/05/23.
//

import SwiftUI

struct OvalShapeView: View {
    var body: some View {
       OvalShape()
    }
}

struct OvalShape: View {
    
    // MARK: Properties
    @State private var appear = false
    
    //MARK: - Body
    var body: some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 60)
            let x = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 10)
            let x2 = cos(angle2.radians)
            
            Canvas{ context,size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, x2: x2), with: .linearGradient(Gradient(colors: [Color("red"),Color("orange")]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 400, y: 400)))
            }
            .frame(width: 400,height: 400)
            .rotationEffect(.degrees(appear ? 360:30))
        }
        .onAppear{
            withAnimation(.linear(duration:10).repeatForever(autoreverses: true)){
                appear = true
            }
        }
    }
    
    
    // MARK: Custom Shape
    func path(in rect: CGRect,x:Double,x2:Double) -> Path {
           var path = Path()
           let width = rect.size.width
           let height = rect.size.height
           path.move(to: CGPoint(x: width, y: 0.66398*height))
           path.addCurve(to: CGPoint(x: 0.5*width*x2, y: height), control1: CGPoint(x: width, y: 0.84956*height), control2: CGPoint(x: 0.77614*width*x2, y: height))
           path.addCurve(to: CGPoint(x: 0, y: 0.66398*height), control1: CGPoint(x: 0.22386*width*x2, y: height), control2: CGPoint(x: 0, y: 0.84956*height))
           path.addCurve(to: CGPoint(x: 0.5*width, y: 0), control1: CGPoint(x: 0, y: 0.4784*height*x2), control2: CGPoint(x: 0.22386*width, y: 0))
           path.addCurve(to: CGPoint(x: width, y: 0.66398*height), control1: CGPoint(x: 0.77614*width*x2, y: 0), control2: CGPoint(x: width, y: 0.4784*height))
           path.closeSubpath()
           return path
       }
}
