//
//  ContentView.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/13/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CurrentWeatherViewModel()
    
    var body: some View {
        VStack(spacing: 30
        ) {
            if let weather = viewModel.currentWeather {
                Text(weather.name)
                    .font(.system(size: 70))
                Text(weather.weather[0].description.capitalized)
                    .font(.system(size: 25))
                Text("\(Int(weather.main.temp.rounded()))º")
                    .font(.system(size: 90))
                Text("Hi: \(Int(weather.main.tempMax))º")
                    .font(.system(size: 25))
                Text("Low: \(Int(weather.main.tempMin))º")
                    .font(.system(size: 25))
            } else {
                Text("Loading")
                    .font(.system(size: 25))
            }
        }
        .onAppear {
            viewModel.fetchCurrentWeather()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                    .previewDisplayName("iPhone 12")

                ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 12 Mini"))
                    .previewDisplayName("iPhone 12 Mini")
    }
}

