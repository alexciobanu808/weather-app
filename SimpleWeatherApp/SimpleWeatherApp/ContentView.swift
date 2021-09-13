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
                api.getCurrentWeather(zip: "48301")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
