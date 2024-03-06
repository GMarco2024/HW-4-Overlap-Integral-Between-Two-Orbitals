//
//  MonteCarlo.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 2/29/24.
//

import Foundation

class MonteCarlo {
    var boundingBox: BoundingBox
    var numberOfGuesses: Int

    init(boundingBox: BoundingBox, numberOfGuesses: Int) {
        self.boundingBox = boundingBox
        self.numberOfGuesses = numberOfGuesses
    }

    // Performs the Monte Carlo integration to approximate the overlap integral.
    func integrate() -> Double {
        var sum: Double = 0.0
        let R = 1.0
        
    // Generate a random point within the bounding box.

        for _ in 0..<numberOfGuesses {
            let randomPoint = boundingBox.generateRandomPoint()

            // Calculate the value of the 1s orbital at atom 1's position
            let orbitalValue1 = OneSOrbital().calculateWavefunction(r: distance(from: randomPoint, to: [0, 0, 0]))

            // Calculate the value of the 1s orbital at atom 2's position
            let orbitalValue2 = OneSOrbital().calculateWavefunction(r: distance(from: randomPoint, to: [R, 0, 0]))

            // Multiply the orbital values to approximate the overlap at this point
            sum += orbitalValue1 * orbitalValue2
        }
        
        //This calculates the average value by dividing the sum by the number of guesses.
        
        let averageValue = sum / Double(numberOfGuesses)
        let result = averageValue * boundingBox.volume

        print("Final Monte Carlo Integration result: \(result)")
        return result
    }

    // Calculates the Euclidean distance between two points in 3D space.
    private func distance(from point1: [Double], to point2: [Double]) -> Double {
        return sqrt(pow(point1[0] - point2[0], 2) +
                    pow(point1[1] - point2[1], 2) +
                    pow(point1[2] - point2[2], 2))
    }
}


//                1s Orbital
//
//                                  3/2
//                /  1   \       /Z\       -Zr/a
//   Psi       =  | ----  |      |-|     e
//      1,0,0     |   __  |      \a/
//                \ |/pi /
//

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
