//
//  UserDefaultsManager.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 07/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    // MARK: - Properties
    static var defaults = UserDefaults.standard
   
    // MARK: - Methods
    class func setCity(to city: String) {
        defaults.set(city, forKey: UDKeys.City.rawValue)
        synchronize()
    }
    
    class func getCity() -> String {
        return defaults.string(forKey: UDKeys.City.rawValue) ?? ""
    }
    
    class func setCountryCode(to countryCode: String) {
        defaults.set(countryCode, forKey: UDKeys.CountryCode.rawValue)
        synchronize()
    }
    
    class func getCountryCode() -> String {
        return defaults.string(forKey: UDKeys.CountryCode.rawValue) ?? ""
    }
    
    class func setCountry(to country: String) {
        defaults.set(country, forKey: UDKeys.Country.rawValue)
        synchronize()
    }
    
    class func getCountry() -> String {
        return defaults.string(forKey: UDKeys.Country.rawValue) ?? ""
    }
    
    class func setZipCode(to zipCode: String) {
        defaults.set(zipCode, forKey: UDKeys.ZipCode.rawValue)
        synchronize()
    }
    
    class func getZipCode() -> String {
        return defaults.string(forKey: UDKeys.ZipCode.rawValue) ?? ""
    }
    
    class func setLat(to lat: Double) {
        defaults.set(lat, forKey: UDKeys.Latitude.rawValue)
        synchronize()
    }
    
    class func getLat() -> Double {
        return defaults.double(forKey: UDKeys.Latitude.rawValue)
    }
    
    class func setLon(to lon: Double) {
        defaults.set(lon, forKey: UDKeys.Longitude.rawValue)
        synchronize()
    }
    
    class func getLon() -> Double {
        return defaults.double(forKey: UDKeys.Longitude.rawValue)
    }
    
    class func synchronize() {
        defaults.synchronize()
    }
}
