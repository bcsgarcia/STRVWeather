//
//  ForecastController.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 07/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

class ForecastController {
    
    func callUrlRequest(onComplete: @escaping ([Forecast])->Void, onError: @escaping (WeatherError)->Void) {
        
        if UserDefaultsManager.getLat() == 0 && UserDefaultsManager.getLon() == 0 {
            onError(.noData)
            return
        }
        
        Rest.sharedInstance.call(urlEnum: .Forecast, lat: UserDefaultsManager.getLat(), lon: UserDefaultsManager.getLon(),
         onComplete: { (jsonData) in
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: jsonData)
                onComplete( self.convertForecast(with: forecastResponse) )
            } catch {
                print("Unexpected error: \(error).")
                onError(.invalidJSON)
            }
        }) { (weatherError) in
            onError(weatherError)
        }
    }
    
    func getWeekDay(from date: Date) -> String {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: date)
        let today = myCalendar.component(.weekday, from: Date())
        if today == weekDay {
            return "Today"
        }
        else {
            return Const.arrWeekDays[weekDay-1]
        }
    }
    
    func convertForecast(with forecastResponse: ForecastResponse) -> [Forecast] {
        var forecastList : [Forecast] = []
        for f in forecastResponse.list {
            guard let dt = f.dtTxt else { continue }
            let forecastFilter = forecastList.filter { $0.weekDay.contains(getWeekDay(from: dt.toDate() )) }.first
            if forecastFilter == nil  {
                var forecast = Forecast(weekDay: getWeekDay(from: dt.toDate()))
                forecast.list.append(f)
                forecastList.append(forecast)
            } else {
                if let i = forecastList.firstIndex(where: { $0.weekDay == getWeekDay(from: dt.toDate()) }) {
                    forecastList[i].list.append(f)
                }
            }
        }
        return forecastList
    }
    
}
