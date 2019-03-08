//
//  Rain.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

struct Rain: Codable {
    var oneHour : Double?
    var threeHour : Double?
    
    enum CodingKeys:String,CodingKey
    {
        case oneHour = "1h"
        case threeHour = "3h"
    }
    
}
