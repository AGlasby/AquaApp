//
//  ViewController.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit
var myAquariums: [Aquarium]!

var myAquarium = Aquarium(name: "juwel")

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(myAquarium.water.waterTests)
        print(myAquarium.water.testsMonitored)
        myAquarium.water.addTestResult(test: "ph", date: NSDate(), result: 7.8)
        print(myAquarium.water.resultsForTest(test: "ph"))

    }
}

