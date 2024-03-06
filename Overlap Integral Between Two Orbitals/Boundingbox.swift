//
//  Boundingbox.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 3/4/24.
//
//


import Foundation

class BoundingBox {
    var xMin: Double
    var xMax: Double
    var yMin: Double
    var yMax: Double
    var zMin: Double
    var zMax: Double

    /// Initializes the bounding box with specific minimum and maximum values for each dimension.
    /// - Parameters:
    ///   - xMin: The minimum value in the X dimension.
    ///   - xMax: The maximum value in the X dimension.
    ///   - yMin: The minimum value in the Y dimension.
    ///   - yMax: The maximum value in the Y dimension.
    ///   - zMin: The minimum value in the Z dimension.
    ///   - zMax: The maximum value in the Z dimension.
    init(xMin: Double, xMax: Double, yMin: Double, yMax: Double, zMin: Double, zMax: Double) {
        self.xMin = xMin
        self.xMax = xMax
        self.yMin = yMin
        self.yMax = yMax
        self.zMin = zMin
        self.zMax = zMax
    }

    /// Calculates the volume of the bounding box.
    var volume: Double {
        return (xMax - xMin) * (yMax - yMin) * (zMax - zMin)
    }

    /// Generates a random point within the bounding box in 3D space.
    /// - Returns: An array of Double representing a random point within the bounding box.
    func generateRandomPoint() -> [Double] {
        let xPoint = Double.random(in: xMin...xMax)
        let yPoint = Double.random(in: yMin...yMax)
        let zPoint = Double.random(in: zMin...zMax)
        return [xPoint, yPoint, zPoint]
    }
}
