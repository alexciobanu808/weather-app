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
        Text("Hello, World!")
    }
}

struct FiveDayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        FiveDayWeatherView()
    }
}
