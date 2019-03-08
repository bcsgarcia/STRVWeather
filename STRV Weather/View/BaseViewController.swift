//
//  BaseViewController.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import UIKit
import MapKit

class BaseViewController: UIViewController {

    // MARK: - Properties
    var locationManager = CLLocationManager()
    var arrViews: [UIView] = []
    
    // MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        setTabBarFont()
        
    }
    
    
    func setTabBarFont(){
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Montserrat-SemiBold", size: 10)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
    }
    

    var timer: Timer? = nil
    
    var y = 0
    
    
    
    @objc func loading() {
        
        UIView.animate(withDuration: 0.1, animations: {
            for x in 0...5 {
                self.arrViews[x].backgroundColor = Const.arrColors[self.y]
                self.y = self.y+1 > 5 ? 0 : self.y+1
            }
            self.y = self.y+1 > 5 ? 0 : self.y+1
        })
    }
    
    func toggleLoading(){
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(WeatherViewController.loading), userInfo: nil, repeats: true)
        }
        else {
            if timer != nil {
                timer!.invalidate()
                timer = nil
                for x in 0...5 {
                    self.arrViews[x].backgroundColor = Const.arrColors[x]
                }
            }
        }
    }

}

extension BaseViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler:
            {
                placemarks, error -> Void in
                
                guard let placeMark = placemarks?.first else { return }
                
                if let city = placeMark.locality {
                    UserDefaultsManager.setCity(to: city)
                }
                
                if let lat = placeMark.location?.coordinate.latitude {
                    UserDefaultsManager.setLat(to: lat)
                }
                
                if let lon = placeMark.location?.coordinate.longitude {
                    UserDefaultsManager.setLon(to: lon)
                }
                
                if let postalCode = placeMark.postalCode {
                    UserDefaultsManager.setZipCode(to: postalCode)
                }
                
                if let countryCode = placeMark.isoCountryCode {
                    UserDefaultsManager.setCountryCode(to: countryCode)
                    
                }
                
                if let country = placeMark.country {
                    UserDefaultsManager.setCountry(to: country)
                }
                
        })
    }
    
}

