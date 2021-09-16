//
//  FiveDayWeatherForecast.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/15/21.
//

import Foundation

struct FiveDayWeatherForecast: Decodable {
    let list: [WeatherEntry]
    let city: City
    
    struct WeatherEntry: Decodable {
        let date: Int
        let dateTimeString: String
        let main: TemperatureDetails
        let weather: [WeatherDescription]
        
        var dateString: String? {
            guard let date = dateTimeString.split(separator: " ").first else { return nil }
            
            return String(date)
        }
        
        struct TemperatureDetails: Decodable {
            let temp: Double
        }
        
        struct WeatherDescription: Decodable {
            let description: String
            let icon: String
        }
        
        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case dateTimeString = "dt_txt"
            case main
            case weather
        }
    }
    
    struct City: Decodable {
        let name: String
    }
}
