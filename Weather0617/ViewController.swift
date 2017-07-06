//
//  ViewController.swift
//  Weather0617
//
//  Created by Kirill Lukyanov on 03.07.17.
//  Copyright © 2017 Kirill Lukyanov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        let url = "http://api.openweathermap.org/data/2.5/forecast?q=London&appid=cc43de317c7b45042d6dd7d09ee12d74"
        var cityName: String = ""
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json["city"]["name"].stringValue)")
                let onlineWeather = WeatherData()
                onlineWeather.city_name = json["city"]["name"].stringValue
//                print("Name2: \(cityName)")
                
               try! realm.write {
                    realm.add(onlineWeather)
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
        print("Name1: \(cityName)")

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

