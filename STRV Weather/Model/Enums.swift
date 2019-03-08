//
//  Enums.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation
import UIKit

enum UDKeys: String {
    case City = "City"
    case CountryCode = "CountryCode"
    case Country = "Country"
    case ZipCode = "ZipCode"
    case Latitude = "Latitude"
    case Longitude = "Longitude"
}

enum HttpUrlRequest : String {
     case Weather = "http://api.openweathermap.org/data/2.5/weather?APPID=305712ce702fef5e05b05a11dc2a4337&"
     case Forecast = "http://api.openweathermap.org/data/2.5/forecast?APPID=305712ce702fef5e05b05a11dc2a4337&"
    static let allValues = [Weather, Forecast]
}

enum WeatherError {
    case invalidJSON
    case url
    case noResponse
    case noData
    case httpError(code: Int)
}
