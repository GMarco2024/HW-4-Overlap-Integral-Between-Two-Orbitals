//
//  ContentView.swift
//  Overlap Integral Between Two Orbitals
//
//  Created by Marco on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    @State private var orbitalSelect1 = "1s"
        @State private var orbitalSelect2 = "1s"
        let orbitalChoices = ["1s", "2px"]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("HW 4 Part 1 - Overlapping Integral of Orbitals")
                    .underline(true, color: .black)
                    .font(.system(size: 20))
                
                Text("We define the Bounding Box in 3D")
                    .font(.headline)
                    .fontWeight(.regular)
                    
                Spacer()
                Spacer()
                
                Text("Xmax, Xmin")
                    .font(.headline)
                    .fontWeight(.regular)
                    .underline(true, color: .black)
                
                HStack(spacing: 10) {
                    TextField("Enter Xmax", text: $viewModel.xMaxString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 200)
                        .padding()
                    
                    TextField("Enter Xmin", text: $viewModel.xMinString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 200)
                        .padding()
                }
                
                Text("Ymax, Ymin")
                    .font(.headline)
                    .fontWeight(.regular)
                    .underline(true, color: .black)
                
                HStack(spacing: 26) {
                    TextField("Enter Ymax", text: $viewModel.yMaxString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 200)
                    
                    TextField("Enter Ymin", text: $viewModel.yMinString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 200)
                        .padding()
                }
                
                Text("Zmax, Zmin")
                    .font(.headline)
                    .fontWeight(.regular)
                    .underline(true, color: .black)
                
                Spacer()
                
                HStack(spacing: 10) {
                    TextField("Enter Zmax", text: $viewModel.zMaxString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 200)
                        .padding()
                    
                    TextField("Enter Zmin", text: $viewModel.zMinString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 200)
                        .padding()
                }
                
                Text("Orbitals")
                    .font(.headline)
                    .fontWeight(.regular)
                    .padding()

                Picker("Pick orbital 1:", selection: $orbitalSelect1) {
                                    ForEach(orbitalChoices, id: \.self) {
                                        Text($0)
                                    }
                                }
                .pickerStyle(.segmented)
                                .padding()
                                
                                Picker("Pick orbital 2:", selection: $orbitalSelect2) {
                                    ForEach(orbitalChoices, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                                .padding()
                
                Text("Enter number of Guesses")
                    .font(.headline)
                    .fontWeight(.regular)
                
                TextField("Number of Guesses", text: $viewModel.numberOfGuesses)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 350)
                    .padding()
                
                Text("Enter Interatomic Spacing R")
                    .font(.headline)
                    .fontWeight(.regular)
                
                TextField("Enter interatomic spacing (R)", text: $viewModel.interatomicSpacing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 350)
                    .padding()
                
               
                
                Button("Calculate") {
                    viewModel.calculateOverlapIntegral()
                }
                
                // Display the results
                
                Text("Analytical Result: \(viewModel.analyticalResult)")
                    .padding()
                
                Text("Monte Carlo Result: \(viewModel.monteCarloResult)")
                    .padding()
                
            }
        
            
              
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
