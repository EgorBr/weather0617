//
//  DetailsCollectionViewController.swift
//  Weather0617
//
//  Created by Kirill Lukyanov on 06.07.17.
//  Copyright © 2017 Kirill Lukyanov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DetailsCollectionViewController: UICollectionViewController {
    
    var city: String = ""
    var tempList: [Double] = []
    var iconList: [String] = []
    var dateList: [String]  = []
    let manager = ManagerData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(city)
        let detailsData = manager.loadDB(cityName: city)
        print(detailsData)
        for value in detailsData[0].tempList {
            tempList.append(value.t)
            iconList.append(value.icon)
            dateList.append(value.date)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tempList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        let label1: UILabel = cell.viewWithTag(1) as! UILabel
        label1.text = String(tempList[indexPath.row])
        let imageView: UIImageView = cell.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named: iconList[indexPath.row])
        let label2: UILabel = cell.viewWithTag(3) as! UILabel
        label2.text = dateList[indexPath.row]
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
