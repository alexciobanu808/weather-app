//
//  FiveDayWeatherView.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/15/21.
//

import SwiftUI

struct FiveDayWeatherView: View {
    @StateObject var viewModel = FiveDayWeatherViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let fiveDayWeather = viewModel.fiveDayWeather {
                Text(fiveDayWeather.city.name)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 50))
                
                List(fiveDayWeather.list, id: \.dateTimeString) { weatherEntry in
                    VStack(alignment: .leading) {
                        Text(viewModel.format(seconds: weatherEntry.date))
                        
                        HStack {
                            if let weatherDescription = weatherEntry.weather.first?.description {
                                Text(weatherDescription.capitalized)
                            }
                            Spacer()
                            Text("\(Int(weatherEntry.main.temp))º")
                                .font(.system(size: 30))
                        }
                    }
                }
            }
            else {
                Text("Loading")
            }
        }
    }
}

struct FiveDayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        FiveDayWeatherView()
    }
}

