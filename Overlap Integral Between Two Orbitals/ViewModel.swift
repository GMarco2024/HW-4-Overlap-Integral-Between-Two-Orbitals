//
//  ViewModel.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 2/29/24.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var interatomicSpacing: Double?
    @Published var numberOfGuesses: Int = 10000
    @Published var result: Double?
    @Published var monteCarloResult: Double?

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
        
        // Prepare for Monte Carlo integration
        calculateMonteCarloIntegration(spacing: spacing)
    }
    
    private func calculateMonteCarloIntegration(spacing: Double) {
        // Define your bounding box; adjust dimensions, lowerBound, and upperBound as needed
        let boundingBox = BoundingBox()
        boundingBox.initWithDimensionsAndRanges(dimensions: 1, lowerBound: [0.0], upperBound: [spacing]) // Example setup
        
        // Define the function for Monte Carlo integration
        let functionToIntegrate: ([Double]) -> Double = { point in
            OrbitalCalculator.calculateOverlapIntegral(spacing: point.first ?? 0.0)
        }
        
        // Setup Monte Carlo integration
        let monteCarlo = MonteCarlo(boundingBox: boundingBox, function: functionToIntegrate, numberOfGuesses: numberOfGuesses)
        
        // Perform Monte Carlo integration
        let integralResult = monteCarlo.integrate()
        
        DispatchQueue.main.async {
            self.monteCarloResult = integralResult
        }
    }
}


