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
                

            Text("Enter Interatomic Spacing R")
                .font(.headline)
                .fontWeight(.regular)
            
            TextField("Enter interatomic spacing (R)", value: $viewModel.interatomicSpacing, format: .number)
                .frame(maxWidth: 350)
                .padding()
            
            TextField("Number of Guesses", value: $viewModel.numberOfGuesses, format: .number)
             // To ensure only numbers are inputted
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
