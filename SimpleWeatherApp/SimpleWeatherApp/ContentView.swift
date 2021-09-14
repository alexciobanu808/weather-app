//
//  ContentView.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                let api = WeatherAPI()
                api.getCurrentWeather(zip: "48381", completionHandler: handleResponse)
                // Get data here
            }
    }
    
    func handleResponse(data: Result<CurrentWeatherForecast, Error>) {
        switch data {
        case .success(let weatherForecast):
            print(weatherForecast)
        case .failure(let error):
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

