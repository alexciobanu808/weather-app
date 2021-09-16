//
//  DateFormatterTests.swift
//  DateFormatterTests
//
//  Created by Alex Ciobanu on 9/13/21.
//

import XCTest
@testable import SimpleWeatherApp

class DateFormatterTests: XCTestCase {

    func testDateFormatterReturnsCorrectFormat() throws {
        let date = Date(timeIntervalSince1970: 1631728800)
        let formatter = DateFormatter.makeDateFormatter()
        
        let formatted = formatter.string(from: date)
        XCTAssertEqual(formatted, "Wed, Sep 15 6:00 PM")
    }
}
