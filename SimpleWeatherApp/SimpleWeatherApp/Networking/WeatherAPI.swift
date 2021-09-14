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
    
    func getCurrentWeather(zip: String, completionHandler: @escaping (Result<CurrentWeatherForecast, Error>) -> Void) {
        let urlString = baseURL + "weather?zip=\(zip),us&appid=\(apiKey)&units=imperial"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CurrentWeatherForecast.self, from: data)
                    completionHandler(.success(decodedResponse))
                } catch {
                    completionHandler(.failure(error))
                }
            } else {
                completionHandler(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            }
        }.resume()
        
    }
    
    
}

