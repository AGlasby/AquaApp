//
//  waterConfigVC.swift
//  AquaApp
//
//  Created by Alan Glasby on 27/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit

class waterConfigVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var waterColView: UICollectionView!
    
//    var waterParamColView: UICollectionView!
    var waterTests: Water!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        waterColView.delegate = self
        waterColView.dataSource = self
    }

    private func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myAquarium.water.waterTests.count
    }
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WaterCell", for: indexPath as IndexPath) as? WaterCell {
            let test = myAquarium.water.waterTests[indexPath.row]
            cell.configureCell(test: test)
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    


}
