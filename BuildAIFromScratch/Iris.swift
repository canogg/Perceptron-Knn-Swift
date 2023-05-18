//
//  Iris.swift
//  BuildAIFromScratch
//
//  Created by Ana Caroline Sampaio Nogueira on 09/05/23.
//

import Foundation

class Iris {
    internal init(id: Int, sepalLengthCm: Double, sepalWidthCm: Double, petalLengthCm: Double, petalWidthCm: Double, species: String) {
        self.id = id
        self.sepalLengthCm = sepalLengthCm
        self.sepalWidthCm = sepalWidthCm
        self.petalLengthCm = petalLengthCm
        self.petalWidthCm = petalWidthCm
        self.species = species
    }

    var id: Int
    var sepalLengthCm:Double
    var sepalWidthCm:Double
    var petalLengthCm:Double
    var petalWidthCm:Double
    var species: String
//    var vector: SIMD4<Double>? {
//        return SIMD4(sepalLengthCm, sepalWidthCm, petalLengthCm, petalWidthCm)
//    }

}

