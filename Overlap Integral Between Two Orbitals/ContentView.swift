//
//  ContentView.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    @State private var XMaxString: String = ""
    @State private var XMinString: String = ""
    @State private var YMaxString: String = ""
    @State private var YMinString: String = ""
    @State private var ZMaxString: String = ""
    @State private var ZMinString: String = ""
    
    var body: some View {
        VStack {
            
            Text("HW 4 Part 1 - Overlapping Integral of Orbitals")
                .underline(true, color: .black)
                .font(.system(size: 20))
            
            Text("We define the Bounding Box in 3D")
                .font(.headline)
                .fontWeight(.regular)
                .padding()
            
            TextField("Enter Xmax", text: $XMaxString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 200)
                .padding()
            
            TextField("Enter Xmin", text: $XMinString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 200)
                .padding()
            
            TextField("Enter Ymax", text: $YMaxString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 200)
                .padding()
            
            TextField("Enter Ymin", text: $YMinString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 200)
                .padding()
            
            TextField("Enter Zmax", text: $ZMaxString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 200)
                .padding()
            
            TextField("Enter Xmin", text: $ZMinString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: 200)
                .padding()
            
            Text("We calculate the Interatomic Spacing R")
                .font(.headline)
                .fontWeight(.regular)
                .padding()
            
            
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
