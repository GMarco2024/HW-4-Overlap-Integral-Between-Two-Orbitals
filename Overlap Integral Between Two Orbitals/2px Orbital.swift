//
//  File.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by PHYS 440 Marco on 3/1/24.
//


//                           2px Orbital
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
    let Z: Double // Atomic number. We have yet to change this.
    let a: Double // Bohr radius. Yeah this too.
    
    func calculateWavefunction(r: Double, theta: Double, phi: Double) -> Double {
        let normalizationFactor = 1.0 / sqrt(32 * Double.pi)
        let radialPart = pow(Z / a, 2.5) * r * exp(-Z * r / (2 * a))
        let angularPart = sin(theta) * cos(phi)
        return normalizationFactor * radialPart * angularPart
    }
}


