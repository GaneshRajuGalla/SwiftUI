//
//  WeatherService.swift
//  Weather
//
//  Created by Ganesh on 13/05/23.
//

import Foundation
import Combine

class WeatherService:ObservableObject{
    @Published var errorMessage:String = ""
    @Published var current:Weather?
    @Published  var forecast:[Weather] = []
    private let key = "Enter your OpenWeather API Key"
    private var cancellableSet: Set<AnyCancellable> = []
    
    func load(latitude:Float,longitude:Float){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let currentURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)&units=metric")!
        URLSession.shared.dataTaskPublisher(for: URLRequest(url: currentURL))
            .map(\.data)
            .decode(type: Weather.self, decoder: decoder)
            .receive(on: RunLoop.main)
            .sink{ completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }receiveValue: {
                self.current = $0
            }
            .store(in: &cancellableSet)
        
        let forecastURL = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(key)&units=metric")!
        URLSession.shared.dataTaskPublisher(for: URLRequest(url: forecastURL))
            .map(\.data)
            .decode(type: ForecastWeather.self, decoder: decoder)
            .receive(on: RunLoop.main)
            .sink{ completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
                
            }receiveValue: {
                self.forecast = $0.list
            }
            .store(in: &cancellableSet)
    }
}
