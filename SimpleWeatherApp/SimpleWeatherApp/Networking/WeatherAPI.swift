//
//  WeatherAPI.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/13/21.
//

import Foundation

class WeatherAPI {
    private let apiKey = "c8d72af6dc2957873c78c2b5fc20d63f"
    private let baseURL = "https://api.openweathermap.org/data/2.5/"
        
    func getCurrentWeather(zip: String) {
        let urlString = baseURL + "weather?zip=\(zip),us&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                print(data)
            } else {
                print("Unknown Error")
            }
        }).resume()

    }
    
}

