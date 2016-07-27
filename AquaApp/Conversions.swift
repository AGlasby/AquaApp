//
//  Conversions.swift
//  AquaApp
//
//  Created by Alan Glasby on 22/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation

func metricToImpDistance(length: Double) -> Double {
    return length * CM_TO_INCH
}

func impToMetricDistance(length: Double) -> Double {
    return length * INCH_TO_CM
}

func litreToGallon(volume: Double) -> Double {
    return volume * LITRE_TO_GALLON
}

func gallonToLitre(volume: Double) -> Double {
    return volume * GALLON_TO_LITRE
}

func gallonToUsGallon(volume: Double) -> Double {
    return volume * GALLON_TO_USGALLON
}

func usGallonToGallon(volume: Double) -> Double {
    return volume * USGALLON_TO_GALLON
}

func litreToUsGallon(volume: Double) -> Double {
    return gallonToUsGallon(litreToGallon(volume))
}

func usGallonToLitre(volume: Double) -> Double {
    return gallonToLitre(usGallonToGallon(volume))
}

func celciusToFarenheit(temperature: Double) -> Double {
    return 32 + temperature * 9 / 5
}

func farenheitToCelcius(temperature: Double) -> Double {
    return (temperature - 32) * 5 / 9
}



