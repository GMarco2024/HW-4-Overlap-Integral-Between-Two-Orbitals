//
//  ViewModel.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 3/4/24.
//

import Foundation

class ViewModel: ObservableObject {
    // Input properties
    @Published var xMaxString: String = "10"
    @Published var xMinString: String = "-10"
    @Published var yMaxString: String = "10"
    @Published var yMinString: String = "-10"
    @Published var zMaxString: String = "10"
    @Published var zMinString: String = "-10"
    @Published var interatomicSpacing: String = ""
    @Published var numberOfGuesses: String = "1000"
    
    @Published var selectedOrbitalTypeA: String = "1s"
        @Published var selectedOrbitalTypeB: String = "1s"
        let orbitalTypes = ["1s", "2px"]
    

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
                
                // Reset results to default
                self.monteCarloResult = 0.0  // Set to 0.0 because we are not performing Monte Carlo for other combinations or showing previous results
                self.analyticalResult = 0.0  // Resetting analytical result as well

                // Check if both selected orbitals are "1s"
                if selectedOrbitalTypeA == "1s" && selectedOrbitalTypeB == "1s" {
                    // Analytical Calculation only for 1s & 1s
                    self.analyticalResult = OrbitalCalculator.calculateOverlapIntegral(spacing: R)
                } else {
                 
                }
            }
        }

