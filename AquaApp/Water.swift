//
//  Water.swift
//  AquaApp
//
//  Created by Alan on 28/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation

class Water {
    
    
    private var _waterTests: [WaterTest] = []
    
    
    var waterTests: [String] {
        var testList = [String]()
        for test in 0..._waterTests.count - 1 {
            testList.append(_waterTests[test].test)
        }
         return testList
    }
    
    var testsMonitored: Dictionary<String, Bool> {
        var testsMonitored = Dictionary<String, Bool>()
        for test in 0..._waterTests.count - 1 {
            testsMonitored[_waterTests[test].test] = _waterTests[test].status
        }
        return testsMonitored
    }
    
    init() {
        var testDetails = WaterTest(test: "", status: false, img: "")
        for (test, image) in WaterTests {
            testDetails.test = test
            testDetails.img = image
            self._waterTests.append(testDetails)
        }

    }
    
    
    
}