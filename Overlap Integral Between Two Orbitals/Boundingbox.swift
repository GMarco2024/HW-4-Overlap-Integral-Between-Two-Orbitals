//
//  Boundingbox.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 2/29/24.
//

import Foundation

class BoundingBox {
    
    var numberOfDimensions: Int = 0
    var lowerRange: [Double] = []
    var upperRange: [Double] = []
    var volume: Double = 1.0
    
    /// Initializes the bounding box with dimensions and ranges.
    /// - Parameters:
    ///   - dimensions: The number of dimensions of the box.
    ///   - lowerBound: An array of lower limits in space of the box, count should be equal to or greater than the dimensions.
    ///   - upperBound: An array of upper limits in space of the box, count should be equal to or greater than the dimensions.
    func initWithDimensionsAndRanges(dimensions: Int, lowerBound: [Double], upperBound: [Double]) {
        self.numberOfDimensions = dimensions
        self.lowerRange = lowerBound
        self.upperRange = upperBound
        self.volume = calculateVolume()
    }
    
    /// Calculates the volume of the multidimensional box.
    /// - Returns: The volume of the box.
    private func calculateVolume() -> Double {
        guard lowerRange.count >= numberOfDimensions, upperRange.count >= numberOfDimensions else {
            print("The limits did not match the number of dimensions.")
            return 1.0
        }
        
        return zip(lowerRange, upperRange).reduce(1.0) { result, bounds in
            result * (bounds.1 - bounds.0)
        }
    }
    
    /// Generates a random point within the bounding box.
    /// - Returns: An array of Double representing a random point within the bounding box.
    func generateRandomPoint() -> [Double] {
        var randomPoint: [Double] = []
        for dimension in 0..<numberOfDimensions {
            let lower = lowerRange[dimension]
            let upper = upperRange[dimension]
            let randomValue = Double.random(in: lower...upper)
            randomPoint.append(randomValue)
        }
        return randomPoint
    }
}
