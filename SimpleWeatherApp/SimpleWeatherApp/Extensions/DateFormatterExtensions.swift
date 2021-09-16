//
//  DateFormatterExtensions.swift
//  SimpleWeatherApp
//
//  Created by Alex Ciobanu on 9/16/21.
//

import Foundation
 
public extension DateFormatter {
    static func makeDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE, MMM d h:mm a"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }
}
