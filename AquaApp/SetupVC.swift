//
//  SetupVC.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit




class SetupVC: UIViewController {

    @IBOutlet weak var waterVC: UIView!
    @IBOutlet weak var equipmentVC: UIView!
    @IBOutlet weak var basicVC: UIView!
    @IBOutlet weak var livestockVC: UIView!



    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        initSegmentController()

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        initSegmentController()

    }



    @IBAction func optionSelect(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            hideSegmentVcs()
            basicVC.hidden = false
        case 1:
            hideSegmentVcs()
            equipmentVC.hidden = false
        case 2:
            hideSegmentVcs()
            waterVC.hidden = false
        case 3:
            hideSegmentVcs()
            livestockVC.hidden = false
        default:
            break;
        }
    }


    func hideSegmentVcs() {
        
        livestockVC.hidden = true
        basicVC.hidden = true
        equipmentVC.hidden = true
        waterVC.hidden = true
    }

    func initSegmentController() {
        segmentedControl.selectedSegmentIndex = 0
        hideSegmentVcs()
        basicVC.hidden = false
    }
}
