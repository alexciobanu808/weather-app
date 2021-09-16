//
//  DecodingTests.swift
//  SimpleWeatherAppTests
//
//  Created by Alex Ciobanu on 9/16/21.
//

import XCTest
@testable import SimpleWeatherApp

class DecodingTests: XCTestCase {

    func testDecodingCurrentWeatherModelSucceeds() {
        let data = """
        {
            "coord": {
                "lon": -83.5924,
                "lat": 42.5758
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "base": "stations",
            "main": {
                "temp": 66.31,
                "feels_like": 67.1,
                "temp_min": 60.35,
                "temp_max": 72.86,
                "pressure": 1017,
                "humidity": 95
            },
            "visibility": 10000,
            "wind": {
                "speed": 9.22,
                "deg": 130
            },
            "clouds": {
                "all": 90
            },
            "dt": 1631562768,
            "sys": {
                "type": 2,
                "id": 2039836,
                "country": "US",
                "sunrise": 1631531546,
                "sunset": 1631576893
            },
            "timezone": -14400,
            "id": 0,
            "name": "Milford",
            "cod": 200
        }
        """.data(using: .utf8)!
        
        let weatherForecast = try? JSONDecoder().decode(CurrentWeatherForecast.self, from: data)
        XCTAssertNotNil(weatherForecast)
        XCTAssertEqual(weatherForecast!.name, "Milford" )
        XCTAssertEqual(weatherForecast!.main.temp, 66.31)
    }
    
    func testDecodingCurrentWeatherModelFails() {
        let data = """
        {
            "coord": {
                "lon": -83.5924,
                "lat": 42.5758
            },
            "weatherr": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "base": "stations",
            "mainn": {
                "temp": 66.31,
                "feels_like": 67.1,
                "temp_min": 60.35,
                "temp_max": 72.86,
                "pressure": 1017,
                "humidity": 95
            },
            "visibility": 10000,
            "wind": {
                "speed": 9.22,
                "deg": 130
            },
            "clouds": {
                "all": 90
            },
            "dt": 1631562768,
            "sys": {
                "type": 2,
                "id": 2039836,
                "country": "US",
                "sunrise": 1631531546,
                "sunset": 1631576893
            },
            "timezone": -14400,
            "id": 0,
            "name": "Milford",
            "cod": 200
        }
        """.data(using: .utf8)!
        
        let weatherForecast = try? JSONDecoder().decode(CurrentWeatherForecast.self, from: data)
        XCTAssertNil(weatherForecast)
    }
}
