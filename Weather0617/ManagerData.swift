//
//  ManagerData.swift
//  Weather0617
//
//  Created by Kirill Lukyanov on 06.07.17.
//  Copyright © 2017 Kirill Lukyanov. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON

class ManagerData {
    
    func loadJSON(city: String)  {
        let realm = try! Realm()

        let url = "http://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=cc43de317c7b45042d6dd7d09ee12d74&units=metric"        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json["city"]["name"].stringValue)")
                let onlineWeather = WeatherData()
                onlineWeather.city_name = json["city"]["name"].stringValue
                for (_, subJson) in json["list"] {
                let tmp = Temp()
                   tmp.t =  subJson["main"]["temp"].doubleValue
                    tmp.icon = subJson["weather"][0]["icon"].stringValue
                    tmp.date = subJson["dt_txt"].stringValue
                    onlineWeather.tempList.append(tmp)
                }
                print(onlineWeather)
                load = true as AnyObject
                try! realm.write {
                    realm.add(onlineWeather, update: true)
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    func loadDB(cityName: String) -> Results<WeatherData>  {
        let realm = try! Realm()
        let data = realm.objects(WeatherData.self).filter("city_name BEGINSWITH %@", cityName)
        
        return data
    }
    
    func loadCityListDB() -> [String]  {
        let realm = try! Realm()
        var cityList: [String] = []
        let data = realm.objects(WeatherData.self)
        
        for value in data {
            cityList.append(value.city_name)
        }
        
        return cityList
    }
    
    
}

var load: AnyObject? {
    get {
        return UserDefaults.standard.object(forKey: "flag") as AnyObject?
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "flag")
        UserDefaults.standard.synchronize()
    }
}
