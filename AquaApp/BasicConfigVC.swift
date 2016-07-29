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
    @IBOutlet weak var volumePkrStack: UIStackView!
    @IBOutlet weak var volumeStack: UIStackView!
    @IBOutlet weak var volumeLbl: UILabel!
    @IBOutlet weak var volumeTxt: UITextField!
    @IBOutlet weak var dimensionLbl: UILabel!
    @IBOutlet weak var optionSelector: UISegmentedControl!
    @IBOutlet weak var nextBtn: UIButton!


    var aquariumShapesNames = Array(AQUARIUM_SHAPES.keys)
    var aquariumShape = ""
    var dimensions = [
        "length": 0.00,
        "depth": 0.00,
        "width": 0.00,
        "sagitta": 0.00,
        "radius": 0.00
    ]

    let shapeComponentCount = 1
    let shapeComponent = 0

    let shapeImageCount = AQUARIUM_IMAGES.count

    let volumeComponentCount = 3
    let maxRowCount = 10000

    let hundredsComponent = 0
    let hundredsComponentValues = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let tensComponent = 1
    let tensComponentValues = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let unitsComponent = 2
    let unitsComponentValues = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    var volumeKnown: Bool!
    var step = 0
    var hundreds = "0"
    var tens = "0"
    var units = "0"


    override func viewDidLoad() {

        super.viewDidLoad()

        shapePkr.dataSource = self
        shapePkr.delegate = self
        volumePkr.dataSource = self
        volumePkr.delegate = self
    }


    override func viewDidAppear(_ animated: Bool) {

        volumeStack.isHidden = true
        volumePkrStack.isHidden = true
        nextBtn.isHidden = true
        initPickerRows(componentCount: volumeComponentCount)
        aquariumShape = aquariumShapesNames[0]
    }


    func initPickerRows(componentCount: Int) {

        let initialValue = maxRowCount / 2
        let row = initialValue
        for count in 0...componentCount - 1 {
            volumePkr.selectRow(row, inComponent: count, animated: false)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case shapePkr:
            return shapeComponentCount
        case volumePkr:
            return volumeComponentCount
        default:
            return 0
        }
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch  pickerView {
        case shapePkr:
            return shapeImageCount
        case volumePkr:
            switch component {
            case hundredsComponent:
                return maxRowCount
            case tensComponent:
                return maxRowCount
            case unitsComponent:
                return maxRowCount
            default:
                return 0
            }
        default:
            return 0
        }
    }



    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        switch pickerView {
        case shapePkr:
            aquariumShapesNames.sort()
            return setLabel(label: aquariumShapesNames[row])
        case volumePkr:
            switch component {
            case hundredsComponent:
                return setLabel(label: String(hundredsComponentValues[row % hundredsComponentValues.count]))
            case tensComponent:
                return setLabel(label: String(tensComponentValues[row % tensComponentValues.count]))
            case unitsComponent:
                return setLabel(label: String(unitsComponentValues[row % unitsComponentValues.count]))
            default:
                return setLabel(label: "Error")
            }
        default:
            return setLabel(label: "Error")
        }
    }


    func setLabel(label: String) -> UIView {

        let shapeLbl: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 24))
        shapeLbl.backgroundColor = UIColor.clear()
        shapeLbl.text = label
        return shapeLbl
    }


    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch pickerView {
        case shapePkr:
            aquariumShape = aquariumShapesNames[row]
            print(aquariumShape)
        case volumePkr:
            if component == 0 {
                hundreds = String(hundredsComponentValues[row % 10])
            } else {
                if component == 1 {
                    tens = String(tensComponentValues[row % 10])
                } else {
                    units = String(unitsComponentValues[row % 10])
                }
            }
        default:
            print("Error")
        }
    }


    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {

        return 50.0
    }


    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {

        switch pickerView {
        case shapePkr:
            return 70.0
        case volumePkr:
            return 70
        default:
            return 70.0
        }
    }


    @IBAction func optionSelect(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            volumeKnown = true
            volumeStack.isHidden = false
            volumePkrStack.isHidden = true
            nextBtn.isHidden = false
        case 1:
            volumeKnown = false
            volumeStack.isHidden = true
            volumePkrStack.isHidden = false
            nextBtn.isHidden = false
            step = 0
            let dim = AQUARIUM_SHAPES[aquariumShape]
            let initialDim = dim![0]
            dimensionLbl.text = "Please enter the \(initialDim):"
        default:
            break;
        }
    }


    @IBAction func nextTouched(sender: UIButton) {

        if !volumeKnown {
        switch aquariumShape {
        case "cuboid":
            getAquariumDimensions()
        case "globe":
            getAquariumDimensions()
        case "bow fronted":
            getAquariumDimensions()
        case "column":
            getAquariumDimensions()
        case "corner":
            getAquariumDimensions()
        case "other":
            getAquariumDimensions()
        default:
            break
        }
        } else {
            let volume = Double(volumeTxt.text!)
            myAquarium.updateVolume(volume: volume!)
            notification()
        }
    }


    func getAquariumDimensions() {

        let shapeDims = AQUARIUM_SHAPES[aquariumShape]
        let nextDimension = nextStep(pass: step, dimension: shapeDims!)
        dimensions[shapeDims![step-1]] = Double("\(hundreds)\(tens)\(units)")
        print(dimensions)
        if nextDimension != "Complete" {
            dimensionLbl.text = "Please enter the \(nextDimension):"
        } else {
            dimensionLbl.isHidden = true
            calculateAquariumVolume(shape: aquariumShape, dimensions: dimensions)
            print("Stop")
            notification()
        }
    }


    func nextStep(pass: Int, dimension: [String]) -> String {

        if pass < (dimension.count-1) {
            let nextDimension = dimension[pass+1]
            step += 1
            return nextDimension
        } else {
            step += 1
            return "Complete"
        }
    }

    func calculateAquariumVolume(shape: String, dimensions: Dictionary<String, Double>) {

        switch shape {
        case "cuboid":
             let volume = myAquarium.calculateVolume(length: dimensions["length"]!, width: dimensions["width"]!, depth: dimensions["depth"]!)
            myAquarium.updateVolume(volume: volume)
        case "globe":
            let volume = myAquarium.calculateVolume(diameter: (dimensions["radius"]! * 2))
            myAquarium.updateVolume(volume: volume)
        case "bow fronted":
            let volume = myAquarium.calculateVolume(length: dimensions["length"]!, width: dimensions["width"]!, depth: dimensions["depth"]!, sagitta: dimensions["sagitta"]!)
            myAquarium.updateVolume(volume: volume)
        case "column":
            let volume = myAquarium.calculateVolume(diameter: (dimensions["radius"]! * 2), depth: dimensions["depth"]!)
            myAquarium.updateVolume(volume: volume)
        case "corner":
            let volume = myAquarium.calculateVolume(radius: dimensions["radius"]!, height: dimensions["depth"]!)
            myAquarium.updateVolume(volume: volume)
        case "other":
            let volume = 0.00
            myAquarium.updateVolume(volume: volume)
        default:
            break
        }
    }

    func notification() {
        nextBtn.isHidden = true

        let alertController = UIAlertController(title: "Basic set-up is complete", message: "Select a different tab to continue with set-up or Back to view data", preferredStyle: UIAlertControllerStyle.alert)

        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)

    }
}


