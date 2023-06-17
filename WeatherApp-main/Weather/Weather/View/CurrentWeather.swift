//
//  CurrentWeather.swift
//  Weather
//
//  Created by Ganesh on 13/05/23.
//

import SwiftUI

struct CurrentWeather: View {
    let current: Weather
    var body: some View {
        VStack(spacing: 28) {
            Text(current.time.formatted(date: .long, time: .standard))
            HStack{
                Image(systemName: current.icon.weatherIcon)
                    .font(.system(size: 98))
                Text("\(current.temeprature.formatted)°")
            }
            Text("\(current.summary)")
        }
    }
}

//struct CurrentWeather_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentWeather()
//    }
//}
