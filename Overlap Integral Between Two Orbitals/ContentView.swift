//
//  ContentView.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            
            Text("HW 4 Part 1 - Overlapping Integral of Orbitals")
                .underline(true, color: .black)
                .font(.system(size: 20))
            
            Text("We calculate the Interatomic Spacing R")
                .font(.headline)
                .fontWeight(.regular)
  
      //comment this out to add image of Equation we are working with
            
      //      Image("Overlap Integral Between Two 1s Orbitals")
      //          .resizable()
      //          .aspectRatio(contentMode: .fit)
      //          .frame(width: 200, height: 200)
      
            Text("Enter Interatomic Spacing R")
                .font(.headline)
                .fontWeight(.regular)
            
            TextField("Enter interatomic spacing (R)", value: $viewModel.interatomicSpacing, format: .number)
                .frame(maxWidth: 350)
                .padding()
            
            Text("Enter number of Guesses")
                .font(.headline)
                .fontWeight(.regular)
            
            TextField("Number of Guesses", value: $viewModel.numberOfGuesses, format: .number)
                .padding()
            
            Button("Calculate") {
                            viewModel.calculateOverlapIntegral()
                        }
                        .padding()
                        
                        if let result = viewModel.result {
                            Text("Direct Calculation Result: \(result, specifier: "%.5f")")
                                .padding()
                        }
                        
                        if let monteCarloResult = viewModel.monteCarloResult {
                            Text("Monte Carlo Result: \(monteCarloResult, specifier: "%.5f")")
                                .padding()
                        }
                    }
                    .padding()
                }
            }

            struct ContentView_Previews: PreviewProvider {
                static var previews: some View {
                    ContentView()
                }
            }
