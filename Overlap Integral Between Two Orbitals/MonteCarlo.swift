//
//  MonteCarlo.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 2/29/24.
//

import Foundation

class MonteCarlo {
    
    var boundingBox: BoundingBox
    var function: ([Double]) -> Double
    var numberOfGuesses: Int
    
    /// Initializes the Monte Carlo integration method with a bounding box, a function to integrate, and the number of guesses.
    /// - Parameters:
    ///   - boundingBox: The bounding box within which to perform the integration.
    ///   - function: The function to integrate over the bounding box.
    ///   - numberOfGuesses: The number of random guesses to use for the integration.
    init(boundingBox: BoundingBox, function: @escaping ([Double]) -> Double, numberOfGuesses: Int) {
        self.boundingBox = boundingBox
        self.function = function
        self.numberOfGuesses = numberOfGuesses
    }
    
    /// Performs the Monte Carlo integration over the bounding box for the specified function.
    /// - Returns: The estimated value of the integral.
    func integrate() -> Double {
        var sum: Double = 0.0
        for _ in 0..<numberOfGuesses {
            let randomPoint = boundingBox.generateRandomPoint()
            sum += function(randomPoint)
            
        }
        
        let averageValue = sum / Double(numberOfGuesses)
        let result = averageValue * boundingBox.volume
        
     
        print("Final Monte Carlo Integration result: \(result)")
        
        return result
    }
}
