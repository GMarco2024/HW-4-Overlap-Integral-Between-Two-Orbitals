import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var interatomicSpacing: Double?
    @Published var numberOfGuesses: Int = 10000
    @Published var result: Double?
    @Published var monteCarloResult: Double?

    // New published properties for the 3D bounding box inputs
    @Published var xMax: Double = 0.0
    @Published var xMin: Double = 0.0
    @Published var yMax: Double = 0.0
    @Published var yMin: Double = 0.0
    @Published var zMax: Double = 0.0
    @Published var zMin: Double = 0.0

    func calculateOverlapIntegral() {
        guard let spacing = interatomicSpacing else {
            print("Interatomic spacing is not provided or invalid.")
            return
        }
        
        // Direct calculation
        let overlapIntegral = OrbitalCalculator.calculateOverlapIntegral(spacing: spacing)
        DispatchQueue.main.async {
            self.result = overlapIntegral
        }
        
        // Prepare for Monte Carlo integration with updated 3D bounding box parameters
        calculateMonteCarloIntegration()
    }
    
    private func calculateMonteCarloIntegration() {
        // Initialize the bounding box with the provided 3D inputs
        let boundingBox = BoundingBox(xMin: xMin, xMax: xMax, yMin: yMin, yMax: yMax, zMin: zMin, zMax: zMax)
        
        // Define the function for Monte Carlo integration. Modify as necessary for your specific use case.
        let functionToIntegrate: ([Double]) -> Double = { point in
            // This is a placeholder function. Replace with your actual function to integrate.
            // Example: return OrbitalCalculator.calculateOverlapIntegral(spacing: point.first ?? 0.0)
            return 1.0 // Placeholder return value
        }
        
        // Setup Monte Carlo integration with the new bounding box
        let monteCarlo = MonteCarlo(boundingBox: boundingBox, function: functionToIntegrate, numberOfGuesses: numberOfGuesses)
        
        // Perform Monte Carlo integration
        let integralResult = monteCarlo.integrate()
        
        DispatchQueue.main.async {
            self.monteCarloResult = integralResult
        }
    }
}
