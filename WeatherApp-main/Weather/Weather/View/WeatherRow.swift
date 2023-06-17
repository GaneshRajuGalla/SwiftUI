//
//  WeatherRow.swift
//  Weather
//
//  Created by Ganesh on 13/05/23.
//

import SwiftUI

struct WeatherRow: View {
    let weather: Weather
    var body: some View {
        HStack{
            Image(systemName: weather.icon.weatherIcon)
                .frame(width: 40)
                .font(.system(size: 28))
            VStack(alignment: .leading) {
                Text(weather.summary)
                Text(weather.time.formatted(date: .long, time: .standard))
                    .font(.system(.footnote))
            }
            Spacer()
            Text("\(weather.temeprature.formatted)°")
                .frame(width: 40)
        }
        .padding(.horizontal,16)
    }
}

//struct WeatherRow_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherRow()
//    }
//}
