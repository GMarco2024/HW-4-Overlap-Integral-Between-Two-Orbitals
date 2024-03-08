import Foundation

class MonteCarlo {
    var boundingBox: BoundingBox
    var numberOfGuesses: Int
    var interatomicSpacing: Double

    init(boundingBox: BoundingBox, numberOfGuesses: Int, interatomicSpacing: Double) {
        self.boundingBox = boundingBox
        self.numberOfGuesses = numberOfGuesses
        self.interatomicSpacing = interatomicSpacing
    }

    // Performs the Monte Carlo integration to approximate the overlap integral for 1s & 1s orbitals.
    func integrate() -> Double {
        var sum: Double = 0.0
        
        for _ in 0..<numberOfGuesses {
            let randomPoint = boundingBox.generateRandomPoint()
            
            // Calculate the value of the 1s orbital at atom 1's position
            let orbitalValue1 = OneSOrbital().calculateWavefunction(r: distance(from: randomPoint, to: [0, 0, 0]))
            
            // Calculate the value of the 1s orbital at atom 2's position
            let orbitalValue2 = OneSOrbital().calculateWavefunction(r: distance(from: randomPoint, to: [interatomicSpacing, 0, 0]))

            // Multiply the orbital values to approximate the overlap at this point
            sum += orbitalValue1 * orbitalValue2
        }
        
        // Calculate the average value by dividing the sum by the number of guesses and multiply by the bounding box volume
        let averageValue = sum / Double(numberOfGuesses)
        let result = averageValue * boundingBox.volume
        
        print("Final Monte Carlo Integration result for 1s & 1s: \(result)")
        return result
    }
    
    // Performs the Monte Carlo integration to approximate the overlap integral for 2px & 2px orbitals.
    func integrateFor2px() -> Double {
        var sum: Double = 0.0
        
        for _ in 0..<numberOfGuesses {
            let randomPoint = boundingBox.generateRandomPoint()
            
            // Calculate the value of the 2px orbital at atom 1's position
            let orbitalValue1 = TwoPxOrbital().calculateWavefunction(x: randomPoint[0], y: randomPoint[1], z: randomPoint[2])
            
            // Calculate the value of the 2px orbital at atom 2's position, considering the interatomic spacing along the x-axis
            let orbitalValue2 = TwoPxOrbital().calculateWavefunction(x: randomPoint[0] - interatomicSpacing, y: randomPoint[1], z: randomPoint[2])

            // Multiply the orbital values to approximate the overlap at this point
            sum += orbitalValue1 * orbitalValue2
        }
        
        // Calculate the average value by dividing the sum by the number of guesses and multiply by the bounding box volume
        let averageValue = sum / Double(numberOfGuesses)
        let result = averageValue * boundingBox.volume
        
        print("Final Monte Carlo Integration result for 2px & 2px: \(result)")
        return result
    }

    // New function for 1s & 2px orbitals
    func integrateFor1s2px() -> Double {
        var sum: Double = 0.0
        
        for _ in 0..<numberOfGuesses {
            let randomPoint = boundingBox.generateRandomPoint()
            
            // Since the function needs to handle both 1s & 2px combinations, we need to calculate both values
            let orbitalValue1 = OneSOrbital().calculateWavefunction(r: distance(from: randomPoint, to: [0, 0, 0]))
            let orbitalValue2 = TwoPxOrbital().calculateWavefunction(x: randomPoint[0] - interatomicSpacing, y: randomPoint[1], z: randomPoint[2])

            // Multiply the orbital values to approximate the overlap at this point
            sum += orbitalValue1 * orbitalValue2
        }
        
        // Calculate the average value by dividing the sum by the number of guesses and multiply by the bounding box volume
        let averageValue = sum / Double(numberOfGuesses)
        let result = averageValue * boundingBox.volume
        
        print("Final Monte Carlo Integration result for 1s & 2px: \(result)")
        return result
    }

    // Helper method for calculating the Euclidean distance between two points in 3D space.
    private func distance(from point1: [Double], to point2: [Double]) -> Double {
        return sqrt(pow(point1[0] - point2[0], 2) +
                    pow(point1[1] - point2[1], 2) +
                    pow(point1[2] - point2[2], 2))
    }
}
