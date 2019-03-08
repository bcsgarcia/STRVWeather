//
//  ForecastResponse.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 07/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation


struct ForecastResponse: Codable {
    
    var cod : String?
    var message : Double?
    var cnt : Int?
    
    var list : [WeatherResponse] = []
    var city : City
    
}
