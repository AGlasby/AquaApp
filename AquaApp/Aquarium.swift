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

    var volume: Double {
        return _volume
    }

    init(name: String, type: String) {
        _name = name
        _type = type
        _volume = 0
    }

    func updateVolume(volume: Double) {
        _volume = volume
    }

    func calculateVolume(length: Double, width: Double, depth: Double) -> Double {
        return (length * width * depth) / LITRE_CONVERT
    }

    func calculateVolume(radius: Double) -> Double {
        return ((4 / 3) * M_PI * pow(radius, 3)) / LITRE_CONVERT
    }

    func calculateVolume(length: Double, width: Double, depth: Double, sagitta: Double) -> Double {
        let base = calculateVolume(length, width: width, depth: depth)
        let radius = (sagitta / 2) + (pow(length, 2) / (8 * sagitta))
        let angle = 2 * acos(1 - sagitta / radius)
        let areaOfBow = (pow(radius,2) / 2) * (angle - sin(angle))
        let volumeOfBow = areaOfBow * depth / LITRE_CONVERT
        return (base + volumeOfBow)
    }

}