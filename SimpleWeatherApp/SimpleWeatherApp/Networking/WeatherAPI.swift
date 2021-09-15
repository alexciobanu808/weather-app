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
    
    func getCurrentWeather(zip: String, completionHandler: @escaping (Result<CurrentWeatherForecast, WeatherAPIError>) -> Void) {
        let urlString = baseURL + "weather?zip=\(zip),us&appid=\(apiKey)&units=imperial"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.network(error)))
            } else if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CurrentWeatherForecast.self, from: data)
                    completionHandler(.success(decodedResponse))
                } catch {
                    completionHandler(.failure(.decoding))
                }
            } else {
                completionHandler(.failure(.unknown))
            }
        }.resume()
    }
    
    func getFiveDayWeather(zip: String, completionHandler: @escaping (Result<FiveDayWeatherForecast, WeatherAPIError>) -> Void) {
        let urlString = baseURL + "forecast?zip=\(zip),us&appid=\(apiKey)&units=imperial"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(.network(error)))
            } else if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(FiveDayWeatherForecast.self, from: data)
                    completionHandler(.success(decodedResponse))
                } catch {
                    completionHandler(.failure(.decoding))
                }
            } else {
                completionHandler(.failure(.unknown))
            }
        }.resume()
    }
}

enum WeatherAPIError: Error {
    case invalidURL
    case decoding
    case network(Error)
    case unknown
}
