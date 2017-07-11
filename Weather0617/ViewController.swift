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

class ViewController: UITableViewController {
    var cityList: [String] = ["Moscow", "London", "Oslo", "Paris"]
    let manager: ManagerData = ManagerData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        if load == nil {
            for newCityJSON in cityList {
                manager.loadJSON(city: newCityJSON)
                
            }
        } else {
            cityList = manager.loadCityListDB()
        }
        

        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cityList[indexPath.row]
        return cell
        
    }
    
    @IBAction func goHome(segue: UIStoryboardSegue) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! DetailsCollectionViewController
                destinationVC.city = cityList[indexPath.row]
            }
            
        }
        
    }
    


}

