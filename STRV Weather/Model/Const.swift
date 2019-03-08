//
//  Const.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation
import UIKit

class Const {
    
    static let sharedInstance = Rest()
    
    static let imgWeather = [
        "snow": [ UIImage(named: "100x100 Snow (Day)") , UIImage(named: "100x100 Snow (Night)")],
        "mist": [ UIImage(named: "100x100 Mist (Day)") , UIImage(named: "100x100 Mist (Night)") ],
        "thunderstorm": [ UIImage(named: "100x100 Thunderstorm (Day)") , UIImage(named: "100x100 Thunderstorm (Night)") ],
        "thunderstorm with rain" : [ UIImage(named: "100x100 Thunderstorm (Day)") , UIImage(named: "100x100 Thunderstorm (Night)") ],
        "clear sky": [ UIImage(named: "100x100 Clear Sky (Day)") , UIImage(named: "100x100 Clear Sky (Night)") ],
        "broken clouds": [ UIImage(named: "100x100 Broken Clouds (Day)") , UIImage(named: "100x100 Broken Clouds (Night)") ],
        "scattered clouds": [ UIImage(named: "100x100 Scattered Clouds (Day)") , UIImage(named: "100x100 Scattered Clouds (Night)") ],
        "few clouds": [ UIImage(named: "100x100 Few Clouds (Day)") , UIImage(named: "100x100 Few Clouds (Night)") ],
        "rain": [ UIImage(named: "100x100 Rain (Day)") , UIImage(named: "100x100 Rain (Night)") ],
        "light rain": [ UIImage(named: "100x100 Rain (Day)") , UIImage(named: "100x100 Rain (Night)") ],
        "moderate rain": [ UIImage(named: "100x100 Rain (Day)") , UIImage(named: "100x100 Rain (Night)") ],
        "heavy intensity rain": [ UIImage(named: "100x100 Rain (Day)") , UIImage(named: "100x100 Rain (Night)") ],
        "shower rain": [ UIImage(named: "100x100 Shower Rain (Day)") , UIImage(named: "100x100 Shower Rain (Night)") ]
        ]
    
    
    static let arrColors = [ #colorLiteral(red: 1, green: 0.4101189778, blue: 0.7974392983, alpha: 1), #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), #colorLiteral(red: 0.03369532153, green: 0.6890986562, blue: 0.002656287979, alpha: 1), #colorLiteral(red: 0.1824092567, green: 0.5699850917, blue: 1, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.805973684, blue: 0.03894568284, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) ]
    
    static let arrWeekDays = [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"
    ]
    
    
}
