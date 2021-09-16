//
//  CurrentWeatherForecast.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/13/21.
//

import Foundation

struct CurrentWeatherForecast: Decodable {
    let weather: [WeatherDetails]
    let main: TemperatureDetails
    let wind: WindDetails
    let name: String
    
    
    struct WeatherDetails: Decodable {
        let main: String
        let description: String
        let icon: String
    }
    
    struct TemperatureDetails: Decodable {
        let temp: Double
        let feelsLike: Double
        let tempMin: Double
        let tempMax: Double
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case humidity
        }
    }
    
    struct WindDetails: Decodable {
        let speed: Double
        let deg: Int
    }
    
}
