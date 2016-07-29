//
//  SetupVC.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit


class SetupVC: UIViewController {
    
    var name: String!

    @IBOutlet weak var waterVC: UIView!
    @IBOutlet weak var equipmentVC: UIView!
    @IBOutlet weak var basicVC: UIView!
    @IBOutlet weak var livestockVC: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!


    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.

//        initSegmentController()
    }


    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(true)
        initSegmentController()
        
        print(name)
    }



    @IBAction func optionSelect(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            hideSegmentVcs()
            basicVC.isHidden = false
        case 1:
            hideSegmentVcs()
            equipmentVC.isHidden = false
        case 2:
            hideSegmentVcs()
            waterVC.isHidden = false
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
}
