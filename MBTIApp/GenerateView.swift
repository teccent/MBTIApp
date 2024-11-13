//
//  GenerateView.swift
//  MBTIApp
//
//  Created by Теона Магай on 26.10.2024.
//

import SwiftUI

struct GenerateView: View {
    @StateObject var viewModel: GenerateViewModel
    /*
    @AppStorage("firstSelected") private var firstSelected = "E"
    @AppStorage("secondSelected") private var secondSelected = "S"
    @AppStorage("thirdSelected") private var thirdSelected = "T"
    @AppStorage("fourthSelected") private var fourthSelected = "J"
    */
    @State var showsDetailView = false
    
    var body: some View {
        NavigationView {
            VStack (spacing: 10) {
                HStack(spacing: 5) {
                    Picker("First letter",
                           selection: 
                            $viewModel.firstSelected) {
                        ForEach(viewModel.firstLetters,
                                id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                    Picker("Second Name",
                           selection: $viewModel.secondSelected) {
                        ForEach(viewModel.secondLetters,
                                id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                    Picker("Third Name",
                           selection: $viewModel.thirdSelected) {
                        ForEach(viewModel.thirdLetters,
                                id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                    Picker("Fourth Name",
                           selection: $viewModel.fourthSelected) {
                        ForEach(viewModel.fourthLetters,
                                id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                }
                Button("Generate type", action:{
                    let chosenCombination: String =
                    $viewModel.firstSelected.wrappedValue +
                    $viewModel.secondSelected.wrappedValue +
                    $viewModel.thirdSelected.wrappedValue +
                    $viewModel.fourthSelected.wrappedValue
                    
                    $viewModel.selectedDescription.wrappedValue = viewModel.types.first {
                        $0.key == chosenCombination
                    }?.value ?? ""
                    $showsDetailView.wrappedValue = true
                })
                .font(.title)
                .buttonStyle(BorderedButtonStyle())
                .tint(.blue)
            }
        }.sheet(isPresented: $showsDetailView) {
            DetailView(
                firstLetter: $viewModel.firstSelected,
                secondLetter: $viewModel.secondSelected,
                thirdLetter: $viewModel.thirdSelected,
                fourthLetter: $viewModel.fourthSelected,
                description: $viewModel.selectedDescription)
        }
    }
}

#Preview {
    GenerateView(viewModel: GenerateViewModel())
}
