//
//  Water.swift
//  AquaApp
//
//  Created by Alan on 28/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation

class Water {
    
    struct testResult {
        
        var test: String
        var date: NSDate
        var result: Double
    }
    
    
    private var _waterTests: [WaterTest] = []
    private var _testResults: [testResult] = []
    
    
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
    
    var testResults: [testResult] {
        return _testResults
    }
    
    
    init() {
        
        var testDetails = WaterTest(test: "", status: false, img: "")
        for (test, image) in WaterTests {
            testDetails.test = test
            testDetails.img = image
            self._waterTests.append(testDetails)
        }

    }
    
    
    func addTestResult(test: String, date: NSDate, result: Double) {
        var newResult = testResult(test: "", date: NSDate(), result: 0.00)
        newResult.test = test
        newResult.date = date
        newResult.result = result
        _testResults.append(newResult)
    }
    
    func resultsForTest(test: String) -> [testResult] {
        var resultsForTests: [testResult] = []
        for tests in 0..._testResults.count - 1 where _testResults[tests].test == test {
            let resultForTest = _testResults[tests]
            resultsForTests.append(resultForTest)
        }
        return resultsForTests
    }
    
    
}
