//
//  SetupVC.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit


class SetupVC: UIViewController {
    
    var aquarium: Aquarium!

    @IBOutlet weak var waterVC: UIView!
    @IBOutlet weak var equipmentVC: UIView!
    @IBOutlet weak var basicVC: UIView!
    @IBOutlet weak var livestockVC: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!


    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }


    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(true)
        initSegmentController()
        
        print(myAquariums[0].name)

    }



    @IBAction func optionSelect(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            hideSegmentVcs()
            basicVC.isHidden = false
        case 1:
            hideSegmentVcs()
            waterVC.isHidden = false
        case 2:
            hideSegmentVcs()
            equipmentVC.isHidden = false
//            performSegue(withIdentifier: "ConfigureEquipment", sender: aquarium)
        case 3:
            hideSegmentVcs()
            livestockVC.isHidden = false
        default:
            break;
        }
    }


    func initSegmentController() {

        segmentedControl.selectedSegmentIndex = 0
        hideSegmentVcs()
        basicVC.isHidden = false
    }


    func hideSegmentVcs() {
        
        livestockVC.isHidden = true
        basicVC.isHidden = true
        equipmentVC.isHidden = true
        waterVC.isHidden = true
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "ConfigureEquipment" {
//            if let embeddedVC = segue.destinationViewController as? EquipmentVC {
//                if let aquarium = sender as? Aquarium {
//                    embeddedVC.aquarium = aquarium
//                }
//            }
//        }
//    }
}
