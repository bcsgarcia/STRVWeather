//
//  WeatherResponse.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    
    var name : String?
    var base : String?
    var cod : Int?
    var dt : Date
    var id : Int64?
    var dtTxt : String?
    
    var coord : Coord?
    var clouds : Clouds
    var main : Main
    var weather : [Weather] = []
    var wind : Wind
    var rain : Rain?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case base
        case cod
        case dt
        case id
        case dtTxt = "dt_txt"
        case coord
        case clouds
        case main
        case weather
        case wind
        case rain
    }
    
    func isDay() -> Bool{
        let hour = Calendar.current.component(.hour, from: dt)
        switch hour {
            case 5..<17 : return true
            default: return false
        }
    }
    
    func getTempCelsius() -> Int {
        return Int(self.main.temp - 273.15)
    }
    
    func getWindDirection()->String {
        
        guard let strDeg = self.wind.deg else {
            return "--"
        }
        
        let deg = Int(strDeg)
        
        if deg <= 45 {
            return "NE"
        }
        else if deg > 45 && deg <= 90 {
            return "E"
        }
        else if deg > 90 && deg <= 135 {
            return "SE"
        }
        else if deg > 135 && deg <= 180 {
            return "S"
        }
        else if deg > 180 && deg <= 225 {
            return "SW"
        }
        else if deg > 225 && deg <= 270 {
            return "W"
        }
        else if deg > 270 && deg <= 315 {
            return "NW"
        }
        else {
            return "N"
        }
        
    }
    
    func getHour() -> String {
        guard let dtTxt = self.dtTxt else { return "00:00" }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: dtTxt.toDate() )
    }
}
