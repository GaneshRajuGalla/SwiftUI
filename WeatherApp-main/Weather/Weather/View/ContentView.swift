//
//  ContentView.swift
//  Weather
//
//  Created by Ganesh on 13/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var weatherService = WeatherService()
    
    var body: some View {
        VStack{
            Text(weatherService.errorMessage)
                .font(.largeTitle)
            
            if let currentWeather = weatherService.current{
                VStack{
                    CurrentWeather(current: currentWeather)
                    List(weatherService.forecast){
                        WeatherRow(weather: $0)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .task {
            weatherService.load(latitude: 51.5074, longitude: 0.1278)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
