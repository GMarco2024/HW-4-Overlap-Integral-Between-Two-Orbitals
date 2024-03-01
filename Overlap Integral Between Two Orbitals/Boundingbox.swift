import Foundation

class BoundingBox {
    
    var lowerRange: [Double]
    var upperRange: [Double]
    var volume: Double
    
    /// Initializes the bounding box with specific minimum and maximum values for each dimension.
    /// - Parameters:
    ///   - xMin: The minimum value in the X dimension.
    ///   - xMax: The maximum value in the X dimension.
    ///   - yMin: The minimum value in the Y dimension.
    ///   - yMax: The maximum value in the Y dimension.
    ///   - zMin: The minimum value in the Z dimension.
    ///   - zMax: The maximum value in the Z dimension.
    init(xMin: Double, xMax: Double, yMin: Double, yMax: Double, zMin: Double, zMax: Double) {
        self.lowerRange = [xMin, yMin, zMin]
        self.upperRange = [xMax, yMax, zMax]
        self.volume = BoundingBox.calculateVolume(lowerRange: self.lowerRange, upperRange: self.upperRange)
    }
    
    /// Calculates the volume of the bounding box based on the lower and upper ranges.
    /// - Returns: The volume of the bounding box.
    private static func calculateVolume(lowerRange: [Double], upperRange: [Double]) -> Double {
        guard lowerRange.count == 3, upperRange.count == 3 else {
            print("The limits did not match the expected number of dimensions (3).")
            return 0.0
        }
        
        return zip(lowerRange, upperRange).reduce(1.0) { result, bounds in
            result * (bounds.1 - bounds.0)
        }
    }
    
    /// Generates a random point within the 3D bounding box.
    /// - Returns: An array of Double representing a random point within the bounding box.
    func generateRandomPoint() -> [Double] {
        return lowerRange.indices.map { i in
            Double.random(in: lowerRange[i]...upperRange[i])
        }
    }
}
