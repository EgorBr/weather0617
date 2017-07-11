//
//  Temp.swift
//  Weather0617
//
//  Created by Kirill Lukyanov on 10.07.17.
//  Copyright © 2017 Kirill Lukyanov. All rights reserved.
//

import Foundation
import RealmSwift

class Temp: Object {
    dynamic var  t: Double = 0
    dynamic var icon: String = ""
    dynamic var date: String = ""
    
}
