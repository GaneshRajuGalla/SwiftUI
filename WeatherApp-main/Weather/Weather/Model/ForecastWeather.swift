//
//  ForecastWeather.swift
//  ForecastWeather
//
//  Created by Ganesh on 13/05/23.
//

import Foundation

struct Weather:Decodable,Identifiable{
    var id: TimeInterval{
        time.timeIntervalSince1970
    }
    let time:Date
    let summary:String
    let icon:String
    let temeprature: Double
    
    enum CodingKeys: String,CodingKey{
        case time = "dt"
        case weather = "weather"
        case summary = "description"
        case main = "main"
        case icon = "icon"
        case temperature = "temp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode(Date.self, forKey: .time)
        var weatherContainer = try container.nestedUnkeyedContainer(forKey: .weather)
        let weather = try weatherContainer.nestedContainer(keyedBy: CodingKeys.self)
        summary = try weather.decode(String.self, forKey: .summary)
        icon = try weather.decode(String.self, forKey: .icon)
        let main = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .main)
        temeprature = try main.decode(Double.self, forKey: .temperature)
    }
}

struct ForecastWeather:Decodable{
    let list: [Weather]
}
