//
//  WeatherViewController.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import UIKit
import MapKit

class WeatherViewController: BaseViewController  {

    // MARK: - IBOutlets
    @IBOutlet weak var ivWeather: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblWeatherDescription: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblPrecipitation: UILabel!
    @IBOutlet weak var lblPressure: UILabel!
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var lblWindDirection: UILabel!
    
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    @IBOutlet weak var v6: UIView!
    
    // MARK: - Properties
    var retrieveWeatherTimer: Timer!
    let retrieveWeatherTimeInterval : TimeInterval = 10
    let weatherController = WeatherController()
    
    
    
    // MARK: - Main Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        super.arrViews = [ v1, v2, v3, v4, v5, v6 ]
        populateFields(with: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if retrieveWeatherTimer == nil {
            retrieveWeatherTimer = Timer.scheduledTimer(timeInterval: retrieveWeatherTimeInterval, target: self, selector: #selector(retrieveWeather), userInfo: nil, repeats: true)
        }
        retrieveWeather()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if retrieveWeatherTimer != nil {
            retrieveWeatherTimer!.invalidate()
            retrieveWeatherTimer = nil
        }
    }
    
    // MARK: - Methods
    @objc func retrieveWeather(){
        
        if UserDefaultsManager.getCity() != "" {
            toggleLoading()
            weatherController.callUrlRequest(onComplete: { (weatherResponse) in
                self.populateFields(with: weatherResponse)
                self.toggleLoading()
            }) { (weatherError) in
                switch weatherError {
                    case .httpError(code: let code):
                        print("Error de HTTP. Codigo \(code)")
                    default:
                        print(weatherError)
                        break
                }
                self.populateFields(with: nil)
                self.toggleLoading()
            }
        }
        else {
            //sleep(3)
            //retrieveWeather()
        }
    }
    
    
    func populateFields(with weatherResponse: WeatherResponse?){
        
        guard let weatherResponse = weatherResponse else {
            ivWeather.image = nil
            lblLocation.text = "--"
            lblWeatherDescription.text = " -- | -- "
            lblHumidity.text = "--"
            lblPrecipitation.text = "--"
            lblPressure.text = "--"
            lblWind.text = "--"
            lblWindDirection.text = "--"
            return
        }
        
        ivWeather.setImgWeather(weather: weatherResponse)
        lblLocation.text = "\(UserDefaultsManager.getCity()), \(UserDefaultsManager.getCountry())"
        lblWeatherDescription.text = " \(weatherResponse.getTempCelsius())ºC | \(weatherResponse.weather.first?.main ?? "" ) "
        lblHumidity.text = "\(weatherResponse.main.humidity)%"
        lblPrecipitation.text = "1.0 mm" //this information does not exists in API response
        lblPressure.text = "\(weatherResponse.main.pressure) hPa"
        lblWind.text = "\(weatherResponse.wind.speed) km/h"
        lblWindDirection.text = "\(weatherResponse.getWindDirection())"
    }
    
    // MARK: - IBActions
    @IBAction func shareClick(_ sender: Any) {
        guard let location = lblLocation.text,
              let weather = lblWeatherDescription.text,
              let humidity = lblHumidity.text,
              let precipitation = lblPrecipitation.text,
              let pressure = lblPressure.text,
              let wind = lblWind.text,
              let windDirection = lblWindDirection.text
        else { return }
        
        let activityViewController = UIActivityViewController(activityItems: [location, "\n\(weather)", "\nHumidity: \(humidity)", "\nPrecipitation: \(precipitation)", "\nPressure: \(pressure)", "\nWind: \(wind)", "\nWind Direction: \(windDirection)"], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func forceUpdate(_ sender: Any) {
        retrieveWeather()
    }
    
    

}

