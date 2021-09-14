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
    }
    
    struct TemperatureDetails: Decodable {
        let temp: Double
        let feels_like: Double //TO-DO make camel case
        let temp_min: Double
        let temp_max: Double
        let humidity: Int
    }
    
    struct WindDetails: Decodable {
        let speed: Double
        let deg: Int
    }
    
}
