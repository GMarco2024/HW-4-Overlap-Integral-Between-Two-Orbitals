//
//  ViewModel.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 3/4/24.
//

import Foundation

class ViewModel: ObservableObject {
    // Input properties
    @Published var xMaxString: String = ""
    @Published var xMinString: String = ""
    @Published var yMaxString: String = ""
    @Published var yMinString: String = ""
    @Published var zMaxString: String = ""
    @Published var zMinString: String = ""
    @Published var interatomicSpacing: String = ""
    @Published var numberOfGuesses: String = ""
    
    // Output properties
    @Published var monteCarloResult: Double = 0
    @Published var analyticalResult: Double = 0
    
    func calculateOverlapIntegral() {
        guard let xMax = Double(xMaxString), let xMin = Double(xMinString),
              let yMax = Double(yMaxString), let yMin = Double(yMinString),
              let zMax = Double(zMaxString), let zMin = Double(zMinString),
              let R = Double(interatomicSpacing), let guesses = Int(numberOfGuesses) else {
            return
        }
        
        // Setup BoundingBox
        let boundingBox = BoundingBox(xMin: xMin, xMax: xMax, yMin: yMin, yMax: yMax, zMin: zMin, zMax: zMax)
        
        // Monte Carlo Calculation
        let monteCarlo = MonteCarlo(boundingBox: boundingBox, function: { point in
            
            
    // Example function, adjust according to your actual calculation needs
            
            return exp(-sqrt(point[0]*point[0] + point[1]*point[1] + point[2]*point[2]))
        }, numberOfGuesses: guesses)
        
        self.monteCarloResult = monteCarlo.integrate()
        
        // Analytical Calculation
        self.analyticalResult = OrbitalCalculator.calculateOverlapIntegral(spacing: R)
    }
}
