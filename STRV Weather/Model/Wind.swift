//
//  Wind.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

struct Wind : Codable {
    var speed : Double
    var deg : Double?
    
    private enum CodingKeys: String, CodingKey {
        case speed
        case deg
    }
    
    
    
}
