//
//  WeatherController.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

class WeatherController {
    
    // MARK: - Methods
    func callUrlRequest(onComplete: @escaping (WeatherResponse)->Void, onError: @escaping (WeatherError)->Void) {
        
        if UserDefaultsManager.getLat() == 0 && UserDefaultsManager.getLon() == 0 {
            onError(.noData)
            return
        }
        
        Rest.sharedInstance.call(urlEnum: .Weather, lat: UserDefaultsManager.getLat(), lon: UserDefaultsManager.getLon(),
         onComplete: { (jsonData) in
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: jsonData)
                onComplete( weatherResponse )
            } catch {
                print("Unexpected error: \(error).")
                onError(.invalidJSON)
            }
        }) { (weatherError) in
            onError(weatherError)
        }
        
    }
    
}
