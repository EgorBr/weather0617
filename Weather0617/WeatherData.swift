//
//  WeatherData.swift
//  Weather0617
//
//  Created by Kirill Lukyanov on 03.07.17.
//  Copyright © 2017 Kirill Lukyanov. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherData: Object {
    dynamic var city_name: String = ""
    var tempList = List<Temp>()
    
    override static func primaryKey() -> String? {
        return "city_name"
    }
}
