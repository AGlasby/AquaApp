//
//  ViewController.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myAquarium = Aquarium(name: "juwel", type: "tropical")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let volume = round(myAquarium.calculateVolume(92, width: 32, depth: 50))
        let volumeS = round(myAquarium.calculateVolume(20))
        let volumeB = round(myAquarium.calculateVolume(92, width: 32, depth: 50, sagitta: (42-32)))

        print("Volume standard Metric: \(volume) Imperial: \(round(litreToGallon(volume))) US: \(round(litreToUsGallon(volume)))")
        print("Volume sphere Metric: \(volumeS) Imperial: \(round(litreToGallon(volumeS))) US: \(round(litreToUsGallon(volumeS)))")
        print("Volume bow Metric: \(volumeB) Imperial: \(round(litreToGallon(volumeB))) US: \(round(litreToUsGallon(volumeB)))")

    }
}

