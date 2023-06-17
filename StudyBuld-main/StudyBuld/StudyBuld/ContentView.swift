//
//  ContentView.swift
//  StudyBuld
//
//  Created by Ganesh Raju Galla on 18/02/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @StateObject private var bulbControl = BulbControl()
    
    //MARK: - Body
    var body: some View {
        ZStack{
            Color.black
            pageView
            BulbView
            bulbPalette
        }
        .ignoresSafeArea()
    }
}

//MARK: - Extension
extension ContentView{
    
    //MARK: - PageView
    @ViewBuilder
    private var pageView:some View{
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text(Page.header)
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                Text(Page.body)
                    .font(.system(size: 18, weight: .regular, design: .rounded))
            }
            .foregroundColor(.gray)
            .padding(.all,30)
            .padding(.top, 100)
        }
        .padding(.vertical)
    }
    
    //MARK: - BulbPalette
    @ViewBuilder
    private var bulbPalette:some View{
        if bulbControl.showBulbColorPicker {
            VStack {
                ColorPicker("", selection: $bulbControl.bulbColor)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.trailing, 20)
                    .padding(.top, 50)
            }
        }
    }
    
    //MARK: - BulbView
    @ViewBuilder
    private var BulbView:some View{
        
        let lamp = Bulb(control: bulbControl)
        
        VStack(spacing: 0) {
            lamp.cord
            
            ZStack {
                lamp.bulbShade
                lamp.bulb
            }
            .frame(width: 50, height: 50)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .padding(.top)
        .foregroundColor(.gray)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    bulbControl.handleDragLocationChanged(to: value) // Handles the angle of rotation and cord length
                })
                .onEnded({ value in
                    bulbControl.handleDragGestureEnd()
                })
        )
        // Double tap to on/off Bulb
        .onTapGesture(count: 2, perform: {
            bulbControl.bulbOnOffState()
        })
        
        // Long press gesture for Color Picker
        .onLongPressGesture {
            bulbControl.showBulbColorPicker.toggle()
        }
        
        .rotationEffect(bulbControl.angle, anchor: .top)
    }
}
