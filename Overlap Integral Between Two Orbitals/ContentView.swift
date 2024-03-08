import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
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
                
                Text("Select Orbitals")
                    .font(.headline)
                Picker("Orbital 1", selection: $viewModel.selectedOrbitalTypeA) {
                    ForEach(viewModel.orbitalTypes, id: \.self) { type in
                        Text(type).tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                Picker("Orbital 2", selection: $viewModel.selectedOrbitalTypeB) {
                    ForEach(viewModel.orbitalTypes, id: \.self) { type in
                        Text(type).tag(type)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
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
                .padding()
                
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
