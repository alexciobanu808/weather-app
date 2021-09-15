//
//  FiveDayWeatherForecast.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/15/21.
//

import Foundation

struct FiveDayWeatherForecast: Decodable {
    let list: [WeatherEntry]
    
    struct WeatherEntry: Decodable {
        let dateString: String
        let main: TemperatureDetails
        let weather: [WeatherDescription]
        
        struct TemperatureDetails: Decodable {
            let temp: Double
        }
        
        struct WeatherDescription: Decodable {
            let description: String
        }
        
        enum CodingKeys: String, CodingKey {
            case dateString = "dt_txt"
            case main
            case weather
        }
    }
}
