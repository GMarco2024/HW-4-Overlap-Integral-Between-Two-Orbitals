//
//  1s Orbital.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by PHYS 440 Marco on 3/1/24.
//
//


//                1s Orbital
//
//                                  3/2
//                /  1   \       /Z\       -Zr/a
//   Psi       =  | ----  |      |-|     e
//      1,0,0     |   __  |      \a/
//                \ |/pi /
//

// 1SOrbital.swift

import Foundation

struct OneSOrbital {
    
    // Atomic number for hydrogen
    let Z: Double = 1.0
    
    // Bohr radius in angstroms
    let a: Double = 0.5292
    
    func calculateWavefunction(r: Double) -> Double {
        let normalizationFactor = 1.0 / sqrt(Double.pi)
        let exponent = -Z * r / a
        let radialPart = pow(Z / a, 1.5)
        return normalizationFactor * radialPart * exp(exponent)
    }
}
