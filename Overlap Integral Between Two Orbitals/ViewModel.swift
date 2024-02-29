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
    @Published var result: Double?
    
    // Function to calculate the overlap integral
    func calculateOverlapIntegral() {
        guard let spacing = interatomicSpacing else {
            
    // Handle the case where spacing is not provided or invalid
            print("Interatomic spacing is not provided or invalid.")
            return
            
        }
        
        // Call the OrbitalCalculator to perform the calculation
        result = OrbitalCalculator.calculateOverlapIntegral(spacing: spacing)
    }
}

