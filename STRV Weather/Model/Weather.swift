//
//  Weather.swift
//  STRV Weather
//
//  Created by Bruno Garcia on 06/03/19.
//  Copyright © 2019 Bruno Garcia. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var id : Int64
    var main : String
    var description : String
    var icon : String
}
