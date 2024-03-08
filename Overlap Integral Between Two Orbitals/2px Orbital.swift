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

struct TwoPxOrbital {
    // Atomic number for hydrogen-like orbitals
    let Z: Double = 1.0

    // Bohr radius in angstroms
    let a: Double = 0.5292

    // Converts Cartesian coordinates to spherical (r, theta, phi)
    func cartesianToSpherical(x: Double, y: Double, z: Double) -> (r: Double, theta: Double, phi: Double) {
        let r = sqrt(x*x + y*y + z*z)
        let theta = acos(z/r)
        let phi = atan2(y, x)
        return (r, theta, phi)
    }

    // Calculates the wavefunction value of a 2px orbital given a point in space (x, y, z)
    func calculateWavefunction(x: Double, y: Double, z: Double) -> Double {
        let (r, theta, phi) = cartesianToSpherical(x: x, y: y, z: z)
        let normalizationFactor = 1.0 / sqrt(32.0 * Double.pi)
        let radialPart = pow(Z / a, 2.5) * r * exp(-Z * r / (2 * a))
        let angularPart = sin(theta) * cos(phi)
        return normalizationFactor * radialPart * angularPart
    }
}
