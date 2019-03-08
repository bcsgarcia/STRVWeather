//
//  Rest.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation
import Alamofire

class Rest {
    
    // MARK: - Singleton
    static let sharedInstance = Rest()
    
    // MARK: - Methods
    func call(urlEnum: HttpUrlRequest, lat: Double, lon: Double, onComplete: @escaping ( Data )->Void, onError: @escaping (WeatherError)->Void ){
        let urlString =  "\(urlEnum.rawValue)\(Const.appID)&lat=\(lat)&lon=\(lon)"
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding(), headers: nil)
            .validate()
            .responseJSON { (response) in
                if response.result.value == nil {
                    onError(.noResponse)
                }
                guard let data = response.data else {
                    onError(.noData)
                    return
                }
                onComplete(data)
        }
    }
    
}
