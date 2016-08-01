//
//  waterConfigVC.swift
//  AquaApp
//
//  Created by Alan Glasby on 27/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit

class waterConfigVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {

    @IBOutlet weak var waterColView: UICollectionView!
    
//    var waterParamColView: UICollectionView!
    var waterTests: Water!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        waterColView.delegate = self
        waterColView.dataSource = self
        
        let lpgr : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(waterConfigVC.handleLongPress(gestureRecognizer:)))
        lpgr.minimumPressDuration = 0.5
        lpgr.delegate = self
        lpgr.delaysTouchesBegan = true
        self.waterColView?.addGestureRecognizer(lpgr)
        
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

        let test = myAquarium.water.waterTests[indexPath.row]
        let testsMonitored = myAquarium.water.testsMonitored
        if testsMonitored[test] == false {
            print(test)
            myAquarium.water.UpdateTestStatus(test: test, status: true)
            print(myAquarium.water.testsMonitored)
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderWidth = 2.0
            cell?.layer.borderColor = UIColor.white().cgColor
        } else {
            myAquarium.water.UpdateTestStatus(test: test, status: false)
            print(myAquarium.water.testsMonitored)
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.layer.borderWidth = 2.0
            cell?.layer.borderColor = UIColor.clear().cgColor
        }
        }
    

    
    func handleLongPress(gestureRecognizer : UILongPressGestureRecognizer){
        
        if (gestureRecognizer.state != UIGestureRecognizerState.ended){
            return
        }
        
        let p = gestureRecognizer.location(in: self.waterColView)
        
        if let indexPath : NSIndexPath = (self.waterColView?.indexPathForItem(at: p))!{
            //do whatever you need to do
            print("Here")
        }
        
    }

}
