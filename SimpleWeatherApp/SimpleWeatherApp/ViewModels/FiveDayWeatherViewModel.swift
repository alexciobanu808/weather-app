//
//  FiveDayWeatherViewModel.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/15/21.
//

import Foundation
import CoreLocation

class FiveDayWeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var fiveDayWeather: FiveDayWeatherForecast?
    let locationManager = CLLocationManager()
    
    private let dateFormatter = DateFormatter.makeDateFormatter()
    private let api = WeatherAPI()
    
    func requestAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func fetchFiveDayWeather(for location: CLPlacemark) {
        guard let zip = location.postalCode else {
            print("Zip not found.")
            return
        }
        
        api.getFiveDayWeather(zip: zip) { [weak self] result in
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
                        self.fetchFiveDayWeather(for: currentLocation)
                    }
                }
            }
        }
    }
    
    func format(seconds: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(seconds))
        
        return dateFormatter.string(from: date)
    }
}


