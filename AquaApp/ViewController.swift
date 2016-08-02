//
//  ViewController.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit
var myAquariums: [Aquarium] = []

var myAquarium = Aquarium(name: "juwel")
var myOtherAquarium = Aquarium(name: "Bio")
var myOtherOtherAquarium = Aquarium(name: "fluval")

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        myAquariums.append(myAquarium)
//        myAquariums.append(myOtherAquarium)
//        myAquariums.append(myOtherOtherAquarium)
//
//        print(myAquarium.water.waterTests)
//        print(myAquarium.water.testsMonitored)
//        myAquarium.water.addTestResult(test: "ph", date: NSDate(), result: 7.8)
//        print(myAquarium.water.resultsForTest(test: "ph"))

        
        if myAquariums.count == 0 {
            askForNewAquariumName()
        
        } else {
            if myAquariums.count == 1 {
                let selectedAquarium = myAquariums[0]
                self.performSegue(withIdentifier: "ShowAquarium", sender: selectedAquarium)


            } else {
                userAquariumSelection()


            }
        }
    }
    
    
    func askForNewAquariumName() {
        var aquariumName: String = ""
        let ac = UIAlertController(title: "No aquariums configured", message: "Please enter a name for your aquarium and we will begin configuration.", preferredStyle: .alert)
        ac.addTextField(configurationHandler: { (textField) -> Void in
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
        } )
  

        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { (action: UIAlertAction!) in
            if let answer = ac.textFields![0].text {
                aquariumName = String(answer)
                let myNewAquarium = Aquarium(name: aquariumName)
                myAquariums.append(myNewAquarium)
                let selectedAquarium = myAquariums[myAquariums.count-1]
                self.performSegue(withIdentifier: "ConfigureAquarium", sender: selectedAquarium)
            }
        })
        ac.addAction(submitAction)
        present(ac, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ConfigureAquarium" {
            if let detailsVC = segue.destinationViewController as? SetupVC {
                if let aquarium = sender as? Aquarium {
                    detailsVC.aquarium = aquarium
                }
            }
        } else {
            if segue.identifier == "ShowAquarium" {
                if let showVC = segue.destinationViewController as? AquariumViewVC {
                    if let aquarium = sender as? Aquarium {
                        showVC.aquarium = aquarium
                    }
                }
            }
        }
    }
    
    func userAquariumSelection() {
      //         Display names of aquariums to select from  
        let ac = UIAlertController(title: "Multiple aquariums configured", message: "Please select one of your aquariums.", preferredStyle: .alert)
        
        let n1 = myAquariums[0].name
        let n2 = myAquariums[1].name
        let n3 = myAquariums[2].name
        
        let aquariumOne = UIAlertAction(title: n1, style: .default) { (_) in
            let selectedAquarium = myAquariums[0]
            self.performSegue(withIdentifier: "ShowAquarium", sender: selectedAquarium)
        }
        
        let aquariumTwo = UIAlertAction(title: n2, style: .default) { (_) in
            let selectedAquarium = myAquariums[1]
            self.performSegue(withIdentifier: "ShowAquarium", sender: selectedAquarium)
        }
        let aquariumThree = UIAlertAction(title: n3, style: .default) { (_) in
            let selectedAquarium = myAquariums[2]
            self.performSegue(withIdentifier: "ShowAquarium", sender: selectedAquarium)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        ac.addAction(aquariumOne)
        ac.addAction(aquariumTwo)
        ac.addAction(aquariumThree)
        ac.addAction(cancelAction)
        
        present(ac, animated: true, completion: nil)
        

    }
}

