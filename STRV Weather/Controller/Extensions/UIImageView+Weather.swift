//
//  UIImageView+Weather.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImgWeather(weather: WeatherResponse) {
        guard let weatherObj = weather.weather.first else { return }
        self.image = Const.imgWeather[weatherObj.description]?[ weather.isDay() ? 0 : 1 ]
    }
    
}


