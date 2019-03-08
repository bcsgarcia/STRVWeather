//
//  Main.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

struct Main: Codable {
    var temp : Double
    var pressure : Double
    var humidity : Int32
    var seaLevel : Int32?
    var grndLevel : Int32?
    var tempMin : Double?
    var tempMax : Double?
    
}
