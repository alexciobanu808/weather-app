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
       let data = currentWeatherForecastSuccess
        
        let weatherForecast = try? JSONDecoder().decode(CurrentWeatherForecast.self, from: data)
        XCTAssertNotNil(weatherForecast)
        XCTAssertEqual(weatherForecast!.name, "Milford" )
        XCTAssertEqual(weatherForecast!.main.temp, 66.31)
    }
    
    func testDecodingCurrentWeatherModelFails() {
       let data = currentWeatherForecastFailure
        
        let weatherForecast = try? JSONDecoder().decode(CurrentWeatherForecast.self, from: data)
        XCTAssertNil(weatherForecast)
    }
    
    func testDecodingFiveDayWeatherModelSucceeds() {
        let data = fiveDayForecastSuccess
        
        let weatherForecast = try? JSONDecoder().decode(FiveDayWeatherForecast.self, from: data)
        XCTAssertNotNil(weatherForecast)
        XCTAssertEqual(weatherForecast!.list.count, 40)
        XCTAssertEqual(weatherForecast!.list.first!.main.temp, 69.78)
    }
    
    func testDecodingFiveDayWeatherModelFails() {
        let data = fiveDayForecastFailure
        let weatherForecast = try? JSONDecoder().decode(FiveDayWeatherForecast.self, from: data)
        XCTAssertNil(weatherForecast)
    }
}

private let currentWeatherForecastSuccess = """
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

let currentWeatherForecastFailure = """
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

let fiveDayForecastSuccess = """
{
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
        {
            "dt": 1631728800,
            "main": {
                "temp": 69.78,
                "feels_like": 69.84,
                "temp_min": 69.78,
                "temp_max": 70.88,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 981,
                "humidity": 72,
                "temp_kf": -0.61
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 78
            },
            "wind": {
                "speed": 7.36,
                "deg": 300,
                "gust": 9.19
            },
            "visibility": 10000,
            "pop": 0.2,
            "rain": {
                "3h": 0.17
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-15 18:00:00"
        },
        {
            "dt": 1631739600,
            "main": {
                "temp": 70.29,
                "feels_like": 69.89,
                "temp_min": 70.29,
                "temp_max": 70.81,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 982,
                "humidity": 61,
                "temp_kf": -0.29
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 83
            },
            "wind": {
                "speed": 8.19,
                "deg": 320,
                "gust": 10.83
            },
            "visibility": 10000,
            "pop": 0.08,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-15 21:00:00"
        },
        {
            "dt": 1631750400,
            "main": {
                "temp": 62.71,
                "feels_like": 61.74,
                "temp_min": 62.71,
                "temp_max": 62.71,
                "pressure": 1017,
                "sea_level": 1017,
                "grnd_level": 983,
                "humidity": 65,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 77
            },
            "wind": {
                "speed": 5.1,
                "deg": 330,
                "gust": 6.98
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-16 00:00:00"
        },
        {
            "dt": 1631761200,
            "main": {
                "temp": 59.47,
                "feels_like": 58.08,
                "temp_min": 59.47,
                "temp_max": 59.47,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 984,
                "humidity": 63,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.68,
                "deg": 10,
                "gust": 2.1
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-16 03:00:00"
        },
        {
            "dt": 1631772000,
            "main": {
                "temp": 57.76,
                "feels_like": 56.71,
                "temp_min": 57.76,
                "temp_max": 57.76,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 985,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.46,
                "deg": 69,
                "gust": 3.15
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-16 06:00:00"
        },
        {
            "dt": 1631782800,
            "main": {
                "temp": 57.09,
                "feels_like": 56.59,
                "temp_min": 57.09,
                "temp_max": 57.09,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 985,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.57,
                "deg": 102,
                "gust": 2.91
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-16 09:00:00"
        },
        {
            "dt": 1631793600,
            "main": {
                "temp": 57.7,
                "feels_like": 57.36,
                "temp_min": 57.7,
                "temp_max": 57.7,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 987,
                "humidity": 89,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.32,
                "deg": 107,
                "gust": 6.06
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-16 12:00:00"
        },
        {
            "dt": 1631804400,
            "main": {
                "temp": 68.99,
                "feels_like": 68.45,
                "temp_min": 68.99,
                "temp_max": 68.99,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 988,
                "humidity": 61,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.28,
                "deg": 144,
                "gust": 7.09
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-16 15:00:00"
        },
        {
            "dt": 1631815200,
            "main": {
                "temp": 74.5,
                "feels_like": 73.76,
                "temp_min": 74.5,
                "temp_max": 74.5,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 987,
                "humidity": 45,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.68,
                "deg": 186,
                "gust": 7.4
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-16 18:00:00"
        },
        {
            "dt": 1631826000,
            "main": {
                "temp": 75.25,
                "feels_like": 74.64,
                "temp_min": 75.25,
                "temp_max": 75.25,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 986,
                "humidity": 46,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.38,
                "deg": 206,
                "gust": 6.08
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-16 21:00:00"
        },
        {
            "dt": 1631836800,
            "main": {
                "temp": 65.57,
                "feels_like": 64.89,
                "temp_min": 65.57,
                "temp_max": 65.57,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 65,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 1
            },
            "wind": {
                "speed": 6.35,
                "deg": 148,
                "gust": 11.07
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-17 00:00:00"
        },
        {
            "dt": 1631847600,
            "main": {
                "temp": 62.15,
                "feels_like": 61.54,
                "temp_min": 62.15,
                "temp_max": 62.15,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 7,
                "deg": 153,
                "gust": 15.43
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-17 03:00:00"
        },
        {
            "dt": 1631858400,
            "main": {
                "temp": 59.95,
                "feels_like": 59.79,
                "temp_min": 59.95,
                "temp_max": 59.95,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 88,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.91,
                "deg": 173,
                "gust": 13.56
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-17 06:00:00"
        },
        {
            "dt": 1631869200,
            "main": {
                "temp": 58.82,
                "feels_like": 58.77,
                "temp_min": 58.82,
                "temp_max": 58.82,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 93,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.19,
                "deg": 196,
                "gust": 9.4
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-17 09:00:00"
        },
        {
            "dt": 1631880000,
            "main": {
                "temp": 58.28,
                "feels_like": 57.9,
                "temp_min": 58.28,
                "temp_max": 58.28,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 986,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.3,
                "deg": 200,
                "gust": 9.53
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-17 12:00:00"
        },
        {
            "dt": 1631890800,
            "main": {
                "temp": 70.79,
                "feels_like": 70.43,
                "temp_min": 70.79,
                "temp_max": 70.79,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 988,
                "humidity": 61,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 7.36,
                "deg": 223,
                "gust": 11.25
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-17 15:00:00"
        },
        {
            "dt": 1631901600,
            "main": {
                "temp": 78.55,
                "feels_like": 78.31,
                "temp_min": 78.55,
                "temp_max": 78.55,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 47,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 7.54,
                "deg": 248,
                "gust": 10.45
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-17 18:00:00"
        },
        {
            "dt": 1631912400,
            "main": {
                "temp": 80.19,
                "feels_like": 80.78,
                "temp_min": 80.19,
                "temp_max": 80.19,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 985,
                "humidity": 48,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 6.62,
                "deg": 244,
                "gust": 9.48
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-17 21:00:00"
        },
        {
            "dt": 1631923200,
            "main": {
                "temp": 70.99,
                "feels_like": 70.99,
                "temp_min": 70.99,
                "temp_max": 70.99,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 984,
                "humidity": 68,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.76,
                "deg": 211,
                "gust": 5.03
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-18 00:00:00"
        },
        {
            "dt": 1631934000,
            "main": {
                "temp": 66.76,
                "feels_like": 66.61,
                "temp_min": 66.76,
                "temp_max": 66.76,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 985,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.76,
                "deg": 198,
                "gust": 6.02
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-18 03:00:00"
        },
        {
            "dt": 1631944800,
            "main": {
                "temp": 65.61,
                "feels_like": 65.68,
                "temp_min": 65.61,
                "temp_max": 65.61,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 985,
                "humidity": 81,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.72,
                "deg": 251,
                "gust": 6.17
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-18 06:00:00"
        },
        {
            "dt": 1631955600,
            "main": {
                "temp": 64.17,
                "feels_like": 64.36,
                "temp_min": 64.17,
                "temp_max": 64.17,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 76
            },
            "wind": {
                "speed": 5.01,
                "deg": 300,
                "gust": 10.07
            },
            "visibility": 10000,
            "pop": 0.02,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-18 09:00:00"
        },
        {
            "dt": 1631966400,
            "main": {
                "temp": 65.79,
                "feels_like": 66.02,
                "temp_min": 65.79,
                "temp_max": 65.79,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 84,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 87
            },
            "wind": {
                "speed": 1.68,
                "deg": 339,
                "gust": 2.19
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-18 12:00:00"
        },
        {
            "dt": 1631977200,
            "main": {
                "temp": 75.09,
                "feels_like": 75.45,
                "temp_min": 75.09,
                "temp_max": 75.09,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 987,
                "humidity": 67,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 99
            },
            "wind": {
                "speed": 4.36,
                "deg": 294,
                "gust": 7.76
            },
            "visibility": 10000,
            "pop": 0.04,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-18 15:00:00"
        },
        {
            "dt": 1631988000,
            "main": {
                "temp": 78.04,
                "feels_like": 78.69,
                "temp_min": 78.04,
                "temp_max": 78.04,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 987,
                "humidity": 67,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 96
            },
            "wind": {
                "speed": 7.23,
                "deg": 278,
                "gust": 9.86
            },
            "visibility": 8818,
            "pop": 0.25,
            "rain": {
                "3h": 1.21
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-18 18:00:00"
        },
        {
            "dt": 1631998800,
            "main": {
                "temp": 79.88,
                "feels_like": 79.88,
                "temp_min": 79.88,
                "temp_max": 79.88,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 986,
                "humidity": 59,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 24
            },
            "wind": {
                "speed": 5.35,
                "deg": 279,
                "gust": 9.42
            },
            "visibility": 10000,
            "pop": 0.61,
            "rain": {
                "3h": 1.95
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-18 21:00:00"
        },
        {
            "dt": 1632009600,
            "main": {
                "temp": 72.12,
                "feels_like": 72.61,
                "temp_min": 72.12,
                "temp_max": 72.12,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 76,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 13
            },
            "wind": {
                "speed": 2.17,
                "deg": 25,
                "gust": 2.66
            },
            "visibility": 10000,
            "pop": 0.57,
            "rain": {
                "3h": 0.18
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-19 00:00:00"
        },
        {
            "dt": 1632020400,
            "main": {
                "temp": 69.21,
                "feels_like": 69.73,
                "temp_min": 69.21,
                "temp_max": 69.21,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 987,
                "humidity": 83,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "clouds": {
                "all": 46
            },
            "wind": {
                "speed": 4.43,
                "deg": 124,
                "gust": 5.84
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-19 03:00:00"
        },
        {
            "dt": 1632031200,
            "main": {
                "temp": 66.85,
                "feels_like": 67.14,
                "temp_min": 66.85,
                "temp_max": 66.85,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 83,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 52
            },
            "wind": {
                "speed": 4.79,
                "deg": 166,
                "gust": 7.02
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-19 06:00:00"
        },
        {
            "dt": 1632042000,
            "main": {
                "temp": 65.34,
                "feels_like": 65.34,
                "temp_min": 65.34,
                "temp_max": 65.34,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 80,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 92
            },
            "wind": {
                "speed": 4.27,
                "deg": 202,
                "gust": 4.72
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-19 09:00:00"
        },
        {
            "dt": 1632052800,
            "main": {
                "temp": 65.14,
                "feels_like": 64.98,
                "temp_min": 65.14,
                "temp_max": 65.14,
                "pressure": 1023,
                "sea_level": 1023,
                "grnd_level": 989,
                "humidity": 77,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 61
            },
            "wind": {
                "speed": 3.83,
                "deg": 203,
                "gust": 3.96
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-19 12:00:00"
        },
        {
            "dt": 1632063600,
            "main": {
                "temp": 76.33,
                "feels_like": 76.39,
                "temp_min": 76.33,
                "temp_max": 76.33,
                "pressure": 1023,
                "sea_level": 1023,
                "grnd_level": 990,
                "humidity": 58,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 83
            },
            "wind": {
                "speed": 5.01,
                "deg": 208,
                "gust": 6.98
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-19 15:00:00"
        },
        {
            "dt": 1632074400,
            "main": {
                "temp": 83.55,
                "feels_like": 84,
                "temp_min": 83.55,
                "temp_max": 83.55,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 989,
                "humidity": 47,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 72
            },
            "wind": {
                "speed": 7.27,
                "deg": 202,
                "gust": 9.28
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-19 18:00:00"
        },
        {
            "dt": 1632085200,
            "main": {
                "temp": 85.06,
                "feels_like": 85.6,
                "temp_min": 85.06,
                "temp_max": 85.06,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 987,
                "humidity": 46,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 10
            },
            "wind": {
                "speed": 5.93,
                "deg": 210,
                "gust": 10.69
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-19 21:00:00"
        },
        {
            "dt": 1632096000,
            "main": {
                "temp": 73.72,
                "feels_like": 73.71,
                "temp_min": 73.72,
                "temp_max": 73.72,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 987,
                "humidity": 62,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02n"
                }
            ],
            "clouds": {
                "all": 13
            },
            "wind": {
                "speed": 7.29,
                "deg": 167,
                "gust": 18.03
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-20 00:00:00"
        },
        {
            "dt": 1632106800,
            "main": {
                "temp": 69.48,
                "feels_like": 69.22,
                "temp_min": 69.48,
                "temp_max": 69.48,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 988,
                "humidity": 66,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 3
            },
            "wind": {
                "speed": 6.82,
                "deg": 196,
                "gust": 21.65
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-20 03:00:00"
        },
        {
            "dt": 1632117600,
            "main": {
                "temp": 67.73,
                "feels_like": 67.68,
                "temp_min": 67.73,
                "temp_max": 67.73,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 1
            },
            "wind": {
                "speed": 5.73,
                "deg": 180,
                "gust": 10.51
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-20 06:00:00"
        },
        {
            "dt": 1632128400,
            "main": {
                "temp": 65.59,
                "feels_like": 65.61,
                "temp_min": 65.59,
                "temp_max": 65.59,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 80,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.68,
                "deg": 187,
                "gust": 10.74
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-20 09:00:00"
        },
        {
            "dt": 1632139200,
            "main": {
                "temp": 65.61,
                "feels_like": 65.34,
                "temp_min": 65.61,
                "temp_max": 65.61,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 6.2,
                "deg": 171,
                "gust": 14.45
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-20 12:00:00"
        },
        {
            "dt": 1632150000,
            "main": {
                "temp": 77.09,
                "feels_like": 77.18,
                "temp_min": 77.09,
                "temp_max": 77.09,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 989,
                "humidity": 57,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 8.57,
                "deg": 179,
                "gust": 13.02
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-20 15:00:00"
        }
    ],
    "city": {
        "id": 0,
        "name": "Milford",
        "coord": {
            "lat": 42.5758,
            "lon": -83.5924
        },
        "country": "US",
        "population": 0,
        "timezone": -14400,
        "sunrise": 1631704473,
        "sunset": 1631749479
    }
}
""".data(using: .utf8)!

let fiveDayForecastFailure = """
{
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "listt": [
        {
            "dt": 1631728800,
            "main": {
                "temp": 69.78,
                "feels_like": 69.84,
                "temp_min": 69.78,
                "temp_max": 70.88,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 981,
                "humidity": 72,
                "temp_kf": -0.61
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 78
            },
            "wind": {
                "speed": 7.36,
                "deg": 300,
                "gust": 9.19
            },
            "visibility": 10000,
            "pop": 0.2,
            "rain": {
                "3h": 0.17
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-15 18:00:00"
        },
        {
            "dt": 1631739600,
            "main": {
                "temp": 70.29,
                "feels_like": 69.89,
                "temp_min": 70.29,
                "temp_max": 70.81,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 982,
                "humidity": 61,
                "temp_kf": -0.29
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 83
            },
            "wind": {
                "speed": 8.19,
                "deg": 320,
                "gust": 10.83
            },
            "visibility": 10000,
            "pop": 0.08,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-15 21:00:00"
        },
        {
            "dt": 1631750400,
            "main": {
                "temp": 62.71,
                "feels_like": 61.74,
                "temp_min": 62.71,
                "temp_max": 62.71,
                "pressure": 1017,
                "sea_level": 1017,
                "grnd_level": 983,
                "humidity": 65,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 77
            },
            "wind": {
                "speed": 5.1,
                "deg": 330,
                "gust": 6.98
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-16 00:00:00"
        },
        {
            "dt": 1631761200,
            "main": {
                "temp": 59.47,
                "feels_like": 58.08,
                "temp_min": 59.47,
                "temp_max": 59.47,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 984,
                "humidity": 63,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 1.68,
                "deg": 10,
                "gust": 2.1
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-16 03:00:00"
        },
        {
            "dt": 1631772000,
            "main": {
                "temp": 57.76,
                "feels_like": 56.71,
                "temp_min": 57.76,
                "temp_max": 57.76,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 985,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.46,
                "deg": 69,
                "gust": 3.15
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-16 06:00:00"
        },
        {
            "dt": 1631782800,
            "main": {
                "temp": 57.09,
                "feels_like": 56.59,
                "temp_min": 57.09,
                "temp_max": 57.09,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 985,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 2.57,
                "deg": 102,
                "gust": 2.91
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-16 09:00:00"
        },
        {
            "dt": 1631793600,
            "main": {
                "temp": 57.7,
                "feels_like": 57.36,
                "temp_min": 57.7,
                "temp_max": 57.7,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 987,
                "humidity": 89,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.32,
                "deg": 107,
                "gust": 6.06
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-16 12:00:00"
        },
        {
            "dt": 1631804400,
            "main": {
                "temp": 68.99,
                "feels_like": 68.45,
                "temp_min": 68.99,
                "temp_max": 68.99,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 988,
                "humidity": 61,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.28,
                "deg": 144,
                "gust": 7.09
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-16 15:00:00"
        },
        {
            "dt": 1631815200,
            "main": {
                "temp": 74.5,
                "feels_like": 73.76,
                "temp_min": 74.5,
                "temp_max": 74.5,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 987,
                "humidity": 45,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.68,
                "deg": 186,
                "gust": 7.4
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-16 18:00:00"
        },
        {
            "dt": 1631826000,
            "main": {
                "temp": 75.25,
                "feels_like": 74.64,
                "temp_min": 75.25,
                "temp_max": 75.25,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 986,
                "humidity": 46,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.38,
                "deg": 206,
                "gust": 6.08
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-16 21:00:00"
        },
        {
            "dt": 1631836800,
            "main": {
                "temp": 65.57,
                "feels_like": 64.89,
                "temp_min": 65.57,
                "temp_max": 65.57,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 65,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 1
            },
            "wind": {
                "speed": 6.35,
                "deg": 148,
                "gust": 11.07
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-17 00:00:00"
        },
        {
            "dt": 1631847600,
            "main": {
                "temp": 62.15,
                "feels_like": 61.54,
                "temp_min": 62.15,
                "temp_max": 62.15,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 7,
                "deg": 153,
                "gust": 15.43
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-17 03:00:00"
        },
        {
            "dt": 1631858400,
            "main": {
                "temp": 59.95,
                "feels_like": 59.79,
                "temp_min": 59.95,
                "temp_max": 59.95,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 88,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.91,
                "deg": 173,
                "gust": 13.56
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-17 06:00:00"
        },
        {
            "dt": 1631869200,
            "main": {
                "temp": 58.82,
                "feels_like": 58.77,
                "temp_min": 58.82,
                "temp_max": 58.82,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 93,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.19,
                "deg": 196,
                "gust": 9.4
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-17 09:00:00"
        },
        {
            "dt": 1631880000,
            "main": {
                "temp": 58.28,
                "feels_like": 57.9,
                "temp_min": 58.28,
                "temp_max": 58.28,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 986,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.3,
                "deg": 200,
                "gust": 9.53
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-17 12:00:00"
        },
        {
            "dt": 1631890800,
            "main": {
                "temp": 70.79,
                "feels_like": 70.43,
                "temp_min": 70.79,
                "temp_max": 70.79,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 988,
                "humidity": 61,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 7.36,
                "deg": 223,
                "gust": 11.25
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-17 15:00:00"
        },
        {
            "dt": 1631901600,
            "main": {
                "temp": 78.55,
                "feels_like": 78.31,
                "temp_min": 78.55,
                "temp_max": 78.55,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 47,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 7.54,
                "deg": 248,
                "gust": 10.45
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-17 18:00:00"
        },
        {
            "dt": 1631912400,
            "main": {
                "temp": 80.19,
                "feels_like": 80.78,
                "temp_min": 80.19,
                "temp_max": 80.19,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 985,
                "humidity": 48,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 6.62,
                "deg": 244,
                "gust": 9.48
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-17 21:00:00"
        },
        {
            "dt": 1631923200,
            "main": {
                "temp": 70.99,
                "feels_like": 70.99,
                "temp_min": 70.99,
                "temp_max": 70.99,
                "pressure": 1018,
                "sea_level": 1018,
                "grnd_level": 984,
                "humidity": 68,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.76,
                "deg": 211,
                "gust": 5.03
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-18 00:00:00"
        },
        {
            "dt": 1631934000,
            "main": {
                "temp": 66.76,
                "feels_like": 66.61,
                "temp_min": 66.76,
                "temp_max": 66.76,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 985,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.76,
                "deg": 198,
                "gust": 6.02
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-18 03:00:00"
        },
        {
            "dt": 1631944800,
            "main": {
                "temp": 65.61,
                "feels_like": 65.68,
                "temp_min": 65.61,
                "temp_max": 65.61,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 985,
                "humidity": 81,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 4.72,
                "deg": 251,
                "gust": 6.17
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-18 06:00:00"
        },
        {
            "dt": 1631955600,
            "main": {
                "temp": 64.17,
                "feels_like": 64.36,
                "temp_min": 64.17,
                "temp_max": 64.17,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 87,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 76
            },
            "wind": {
                "speed": 5.01,
                "deg": 300,
                "gust": 10.07
            },
            "visibility": 10000,
            "pop": 0.02,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-18 09:00:00"
        },
        {
            "dt": 1631966400,
            "main": {
                "temp": 65.79,
                "feels_like": 66.02,
                "temp_min": 65.79,
                "temp_max": 65.79,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 84,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 87
            },
            "wind": {
                "speed": 1.68,
                "deg": 339,
                "gust": 2.19
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-18 12:00:00"
        },
        {
            "dt": 1631977200,
            "main": {
                "temp": 75.09,
                "feels_like": 75.45,
                "temp_min": 75.09,
                "temp_max": 75.09,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 987,
                "humidity": 67,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 99
            },
            "wind": {
                "speed": 4.36,
                "deg": 294,
                "gust": 7.76
            },
            "visibility": 10000,
            "pop": 0.04,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-18 15:00:00"
        },
        {
            "dt": 1631988000,
            "main": {
                "temp": 78.04,
                "feels_like": 78.69,
                "temp_min": 78.04,
                "temp_max": 78.04,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 987,
                "humidity": 67,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 96
            },
            "wind": {
                "speed": 7.23,
                "deg": 278,
                "gust": 9.86
            },
            "visibility": 8818,
            "pop": 0.25,
            "rain": {
                "3h": 1.21
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-18 18:00:00"
        },
        {
            "dt": 1631998800,
            "main": {
                "temp": 79.88,
                "feels_like": 79.88,
                "temp_min": 79.88,
                "temp_max": 79.88,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 986,
                "humidity": 59,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": {
                "all": 24
            },
            "wind": {
                "speed": 5.35,
                "deg": 279,
                "gust": 9.42
            },
            "visibility": 10000,
            "pop": 0.61,
            "rain": {
                "3h": 1.95
            },
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-18 21:00:00"
        },
        {
            "dt": 1632009600,
            "main": {
                "temp": 72.12,
                "feels_like": 72.61,
                "temp_min": 72.12,
                "temp_max": 72.12,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 986,
                "humidity": 76,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 13
            },
            "wind": {
                "speed": 2.17,
                "deg": 25,
                "gust": 2.66
            },
            "visibility": 10000,
            "pop": 0.57,
            "rain": {
                "3h": 0.18
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-19 00:00:00"
        },
        {
            "dt": 1632020400,
            "main": {
                "temp": 69.21,
                "feels_like": 69.73,
                "temp_min": 69.21,
                "temp_max": 69.21,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 987,
                "humidity": 83,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "clouds": {
                "all": 46
            },
            "wind": {
                "speed": 4.43,
                "deg": 124,
                "gust": 5.84
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-19 03:00:00"
        },
        {
            "dt": 1632031200,
            "main": {
                "temp": 66.85,
                "feels_like": 67.14,
                "temp_min": 66.85,
                "temp_max": 66.85,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 83,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 52
            },
            "wind": {
                "speed": 4.79,
                "deg": 166,
                "gust": 7.02
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-19 06:00:00"
        },
        {
            "dt": 1632042000,
            "main": {
                "temp": 65.34,
                "feels_like": 65.34,
                "temp_min": 65.34,
                "temp_max": 65.34,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 80,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "clouds": {
                "all": 92
            },
            "wind": {
                "speed": 4.27,
                "deg": 202,
                "gust": 4.72
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-19 09:00:00"
        },
        {
            "dt": 1632052800,
            "main": {
                "temp": 65.14,
                "feels_like": 64.98,
                "temp_min": 65.14,
                "temp_max": 65.14,
                "pressure": 1023,
                "sea_level": 1023,
                "grnd_level": 989,
                "humidity": 77,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 61
            },
            "wind": {
                "speed": 3.83,
                "deg": 203,
                "gust": 3.96
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-19 12:00:00"
        },
        {
            "dt": 1632063600,
            "main": {
                "temp": 76.33,
                "feels_like": 76.39,
                "temp_min": 76.33,
                "temp_max": 76.33,
                "pressure": 1023,
                "sea_level": 1023,
                "grnd_level": 990,
                "humidity": 58,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 83
            },
            "wind": {
                "speed": 5.01,
                "deg": 208,
                "gust": 6.98
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-19 15:00:00"
        },
        {
            "dt": 1632074400,
            "main": {
                "temp": 83.55,
                "feels_like": 84,
                "temp_min": 83.55,
                "temp_max": 83.55,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 989,
                "humidity": 47,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 72
            },
            "wind": {
                "speed": 7.27,
                "deg": 202,
                "gust": 9.28
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-19 18:00:00"
        },
        {
            "dt": 1632085200,
            "main": {
                "temp": 85.06,
                "feels_like": 85.6,
                "temp_min": 85.06,
                "temp_max": 85.06,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 987,
                "humidity": 46,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 10
            },
            "wind": {
                "speed": 5.93,
                "deg": 210,
                "gust": 10.69
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-19 21:00:00"
        },
        {
            "dt": 1632096000,
            "main": {
                "temp": 73.72,
                "feels_like": 73.71,
                "temp_min": 73.72,
                "temp_max": 73.72,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 987,
                "humidity": 62,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02n"
                }
            ],
            "clouds": {
                "all": 13
            },
            "wind": {
                "speed": 7.29,
                "deg": 167,
                "gust": 18.03
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-20 00:00:00"
        },
        {
            "dt": 1632106800,
            "main": {
                "temp": 69.48,
                "feels_like": 69.22,
                "temp_min": 69.48,
                "temp_max": 69.48,
                "pressure": 1021,
                "sea_level": 1021,
                "grnd_level": 988,
                "humidity": 66,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "clouds": {
                "all": 3
            },
            "wind": {
                "speed": 6.82,
                "deg": 196,
                "gust": 21.65
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-09-20 03:00:00"
        },
        {
            "dt": 1632117600,
            "main": {
                "temp": 67.73,
                "feels_like": 67.68,
                "temp_min": 67.73,
                "temp_max": 67.73,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 1
            },
            "wind": {
                "speed": 5.73,
                "deg": 180,
                "gust": 10.51
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-20 06:00:00"
        },
        {
            "dt": 1632128400,
            "main": {
                "temp": 65.59,
                "feels_like": 65.61,
                "temp_min": 65.59,
                "temp_max": 65.59,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 80,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 5.68,
                "deg": 187,
                "gust": 10.74
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-20 09:00:00"
        },
        {
            "dt": 1632139200,
            "main": {
                "temp": 65.61,
                "feels_like": 65.34,
                "temp_min": 65.61,
                "temp_max": 65.61,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 988,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 6.2,
                "deg": 171,
                "gust": 14.45
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-20 12:00:00"
        },
        {
            "dt": 1632150000,
            "main": {
                "temp": 77.09,
                "feels_like": 77.18,
                "temp_min": 77.09,
                "temp_max": 77.09,
                "pressure": 1022,
                "sea_level": 1022,
                "grnd_level": 989,
                "humidity": 57,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": {
                "all": 0
            },
            "wind": {
                "speed": 8.57,
                "deg": 179,
                "gust": 13.02
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-09-20 15:00:00"
        }
    ],
    "city": {
        "id": 0,
        "name": "Milford",
        "coord": {
            "lat": 42.5758,
            "lon": -83.5924
        },
        "country": "US",
        "population": 0,
        "timezone": -14400,
        "sunrise": 1631704473,
        "sunset": 1631749479
    }
}
""".data(using: .utf8)!
