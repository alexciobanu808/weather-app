//
//  SimpleWeatherAppApp.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/13/21.
//

import SwiftUI

@main
struct SimpleWeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CurrentWeatherView()
                    .tabItem {
                        Label("Current", systemImage: "clock")
                    }
                
                FiveDayWeatherView()
                    .tabItem {
                        Label("5 Day", systemImage: "5.circle")
                    }
            }
        }
    }
}
