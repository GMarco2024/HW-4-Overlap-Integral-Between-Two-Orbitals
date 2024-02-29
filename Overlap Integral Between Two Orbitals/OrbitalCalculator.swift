//
//  OrbitalCalculator.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 2/29/24.
//

import Foundation

import Foundation

struct OrbitalCalculator {
    static let a0: Double = 0.529 * pow(10, -10)

    static func calculateOverlapIntegral(spacing R: Double) -> Double {
        let Rmeters = R * pow(10, -10)
        let exponentPart = exp(-Rmeters / a0)
        let polynomialPart = 1 + (Rmeters / a0) + (pow(Rmeters, 2) / (3 * pow(a0, 2)))
        let overlapIntegral = exponentPart * polynomialPart
        return overlapIntegral
    }
}


