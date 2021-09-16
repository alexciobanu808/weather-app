//
//  CurrentWeatherViewModel.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/14/21.
//

import Foundation
import CoreLocation

class CurrentWeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var currentWeather: CurrentWeatherForecast?
    let locationManager = CLLocationManager()
    
    private let api = WeatherAPI()
    
    func requestAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func fetchCurrentWeather(for location: CLPlacemark) {
        guard let zip = location.postalCode else {
            print("Zip not found.")
            return
        }
        
        api.getCurrentWeather(zip: zip) { [weak self] data in
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
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
            if let location = manager.location {
                CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    if let currentLocation = placemarks?.first {
                        self.fetchCurrentWeather(for: currentLocation)
                    }
                }
            }
        }
    }
}
