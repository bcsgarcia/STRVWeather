//
//  City.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 07/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

struct City: Codable {
    
    var id: Int64
    var name: String
    var country: String
    var population: Int64
    var coord: Coord
    
}
