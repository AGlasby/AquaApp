//
//  Constants.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation

let LITRE_CONVERT = 1000.00

let INCH_TO_CM = 2.54
let CM_TO_INCH = 1 / INCH_TO_CM

let GALLON_TO_LITRE = 4.55
let LITRE_TO_GALLON = 1/GALLON_TO_LITRE

let GALLON_TO_USGALLON = 1.2
let USGALLON_TO_GALLON = 1 / GALLON_TO_USGALLON

let AQUARIUM_TYPE = ["Marine", "Tropical", "Brackish", "Unheated"]

let AQUARIUM_SHAPES = [
        "cuboid": ["length", "width", "depth"],
        "globe": ["radius"],
        "bow fronted": ["length", "width", "depth", "sagitta"],
        "column": ["radius", "depth"],
        "corner": ["radius", "depth"],
        "other": [""]]

let AQUARIUM_IMAGES = ["cuboid.png", "globe.png", "bow_fronted.png", "column.png", "corner.png", "other.png"]

    let NOT_STARTED = -1


