//
//  OrbitalCalculator.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 2/29/24.
//

import Foundation

// Struct to calculate the overlap integral between two 1s orbitals
//
//
//                  /                   \
//                  |                   |
// S(R)  =  e^ - R  |   1+ R   + R^2    |
//              --- |     --     ---    |
//               a0 |     a0    3a0^2   |
//                  |                   |
//                  \                   /


struct OrbitalCalculator {
    
    // Bohr radius in meters
    
    static let a0: Double = 0.529 * pow(10, -10)

    // Function to calculate the overlap integral for two 1s orbitals given their interatomic spacing, R
    static func calculateOverlapIntegral(spacing R: Double) -> Double {
        
        // Convert R from Angstroms to meters for calculation
        
        let Rmeters = R * pow(10, -10)
        
        // Calculate the exponential part of the formula, representing the exponential decay of overlap with distance
        
        let exponentPart = exp(-Rmeters / a0)
        
        // Calculate the polynomial part of the formula, adjusting the exponential decay with a linear and quadratic term to more accurately reflect orbital overlap
        
        let polynomialPart = 1 + (Rmeters / a0) + (pow(Rmeters, 2) / (3 * pow(a0, 2)))
        
        // Calculate the total overlap integral by multiplying the exponential and polynomial parts
        let overlapIntegral = exponentPart * polynomialPart
        
        return overlapIntegral
    }
}


