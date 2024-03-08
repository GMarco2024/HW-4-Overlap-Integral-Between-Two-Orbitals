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

        // Resetting results for each calculation
        self.monteCarloResult = 0.0
        self.analyticalResult = 0.0

        // Check for 1s & 1s orbital overlap calculation
        if selectedOrbitalTypeA == "1s" && selectedOrbitalTypeB == "1s" {
            // Perform analytical calculation for 1s & 1s
            self.analyticalResult = OrbitalCalculator.calculateOverlapIntegral(spacing: R)
        }
        
        // Check for 2px & 2px orbital overlap calculation
        else if selectedOrbitalTypeA == "2px" && selectedOrbitalTypeB == "2px" {
          


            let boundingBox = BoundingBox(xMin: xMin, xMax: xMax, yMin: yMin, yMax: yMax, zMin: zMin, zMax: zMax)
            
            
       //     let monteCarlo = MonteCarlo(boundingBox: boundingBox, numberOfGuesses: guesses, interatomicSpacing: R)
            
           // DON'T DELETE. This will be used in th far future.
     //   self.monteCarloResult = monteCarlo.integrateFor2px()
            
        } else {
            // For combinations other than 1s & 1s or 2px & 2px.
            print("Selected orbital combination calculation is not supported yet.")
        }
    }
}
