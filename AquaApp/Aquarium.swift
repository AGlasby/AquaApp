//
//  Aquarium.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation

class Aquarium {

    private var _name: String!
    private var _volume: Double!
    private var _type: String!
    
    private var _water = Water()

    
    var name: String {
        return _name
    }
    
    
    var volume: Double {
        return _volume
    }
    
    
    var water: Water {
        return _water
    }
    

    init(name: String) {
        _name = name
        _type = ""
        _volume = 0
    }
    

    func updateVolume(volume: Double) {

        _volume = volume
    }


    func updateName(name: String) {
        
        _name = name
    }


    func calculateVolume(length: Double, width: Double, depth: Double) -> Double {

//        cuboid

        return (length * width * depth) / LITRE_CONVERT
    }


    func calculateVolume(diameter: Double) -> Double {

//        globe

        return ((4 / 3) * M_PI * pow((diameter / 2), 3)) / LITRE_CONVERT
    }


    func calculateVolume(length: Double, width: Double, depth: Double, sagitta: Double) -> Double {

//        bow fronted

        let base = calculateVolume(length: length, width: width, depth: depth)
        let radius = (sagitta / 2) + (pow(length, 2) / (8 * sagitta))
        let angle = 2 * acos(1 - sagitta / radius)
        let areaOfBow = (pow(radius,2) / 2) * (angle - sin(angle))
        let volumeOfBow = areaOfBow * depth / LITRE_CONVERT
        return (base + volumeOfBow)
    }


    func calculateVolume(radius: Double, height: Double) -> Double {

//        corner

        let area = (pow(radius,2) * M_PI) / 4
        let volumeOfCorner = area * height / LITRE_CONVERT
        return volumeOfCorner
    }


    func calculateVolume(diameter: Double, depth: Double) -> Double {

//        column or cylinder

        let area = (pow((diameter / 2),2) * M_PI)
        let volumeOfColumn = area * depth / LITRE_CONVERT
        return volumeOfColumn
    }
    
    


}
