//
//  Forecast.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 07/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

struct Forecast : Codable {
    
    var weekDay: String = ""
    var list: [WeatherResponse] = []
    
    init(weekDay: String) {
        self.weekDay = weekDay
    }
    
}
