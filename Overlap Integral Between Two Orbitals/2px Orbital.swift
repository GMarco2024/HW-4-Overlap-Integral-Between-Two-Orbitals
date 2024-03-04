//
//  2PXOrbital.swift.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by PHYS 440 Marco on 3/1/24.
//


//                           2px Orbital Wavefuntion
//
//                                    5
//                                    -
//                   1       /Z\      2
//   Psi       =   ------    |-|         re^-Zr/2a    sin(theta) cos(phi)
//      2,1,1       ____     \a/
//                 /32pi
//


import Foundation

struct TwoPXOrbital {
    
    // Atomic number for hydrogen
    let Z: Double = 1.0
    
    // Bohr radius in angstroms
    let a: Double = 0.5292
    
    func calculateWavefunction(r: Double, theta: Double, phi: Double) -> Double {
        let normalizationFactor = sqrt(4.0 * Z.pow(5) / (32.0 * Double.pi * a.pow(5)))
        let radialPart = r * exp(-Z * r / (2 * a))
        let angularPart = sin(theta) * cos(phi)
        return normalizationFactor * radialPart * angularPart
    }
}
