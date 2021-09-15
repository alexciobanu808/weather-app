//
//  FiveDayWeatherViewModel.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/15/21.
//

import Foundation

class FiveDayWeatherViewModel: ObservableObject {
    @Published var fiveDayWeather: FiveDayWeatherForecast?
    
    private let api = WeatherAPI()
    
    func fetchFiveDayWeather() {
        api.getFiveDayWeather(zip: "48381") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fiveDayForecast):
                    self?.fiveDayWeather = fiveDayForecast
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
