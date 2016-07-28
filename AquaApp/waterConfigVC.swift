//
//  waterConfigVC.swift
//  AquaApp
//
//  Created by Alan Glasby on 27/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit

class waterConfigVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var waterParamColView: UICollectionView!
    var waterTests: Water!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        waterParamColView.delegate = self
        waterParamColView.dataSource = self
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myAquarium.water.waterTests.count
    }
  
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WaterCell", forIndexPath: indexPath) as? WaterCell {
                let water: Water!
//            water =
        
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    


}
