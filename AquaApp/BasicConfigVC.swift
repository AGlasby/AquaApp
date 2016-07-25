//
//  BasicConfigVC.swift
//  AquaApp
//
//  Created by Alan Glasby on 23/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit

class BasicConfigVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var shapePkr: UIPickerView!
    @IBOutlet weak var volumePkr: UIPickerView!
    @IBOutlet weak var volumeStack: UIStackView!
//    @IBOutlet weak var volumeLbl: UILabel!

    @IBOutlet weak var optionSelector: UISegmentedControl!

    var shapePicker: UIPickerView!

    let shapeNameCount = AQUARIUM_SHAPES.count
    let shapeImageCount = AQUARIUM_IMAGES.count
    let componentCount = 1
    let shapeComponent = 0
//    let textComponent = 1


    override func viewDidLoad() {
        super.viewDidLoad()

        shapePkr.dataSource = self
        shapePkr.delegate = self


        // Do any additional setup after loading the view.

    }

    override func viewDidAppear(animated: Bool) {
        volumeStack.hidden = true
        volumePkr.hidden = true
    }


    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return componentCount
    }


    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == shapeComponent {
            return shapeImageCount
        } else {
            return shapeNameCount
        }
    }


    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {

//        let shapeImg: UIImageView = 
            let shapeLbl: UILabel = UILabel(frame: CGRectMake(0, 0, 100, 24))
            shapeLbl.backgroundColor = UIColor.clearColor()
            shapeLbl.text = AQUARIUM_SHAPES[row]
            return shapeLbl
    }


    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Title"
    }


    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        print(AQUARIUM_SHAPES[row])
    }


    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {

        return 55.0
    }


    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {

        return 150.0
    }

    @IBAction func optionSelect(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            volumeStack.hidden = false
            volumePkr.hidden = true
        case 1:
            volumeStack.hidden = true
            volumePkr.hidden = false
        default:
            break;
        }
    }
}
