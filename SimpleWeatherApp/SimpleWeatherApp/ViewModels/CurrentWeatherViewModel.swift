//
//  CurrentWeatherViewModel.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/14/21.
//

import Foundation

class CurrentWeatherViewModel: ObservableObject {
    @Published var currentWeather: CurrentWeatherForecast?
    
    private let api = WeatherAPI()
    
    func fetchCurrentWeather() {
        api.getCurrentWeather(zip: "48381") { [weak self] data in
            DispatchQueue.main.async {
                switch data {
                case .success(let weatherForecast):
                    self?.currentWeather = weatherForecast
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
