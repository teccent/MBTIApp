//
//  GenerateView.swift
//  MBTIApp
//
//  Created by Теона Магай on 26.10.2024.
//

import SwiftUI

struct GenerateView: View {
    @StateObject var viewModel: GenerateViewModel
    
    @AppStorage("firstSelected") private var firstSelected = "E"
    @AppStorage("secondSelected") private var secondSelected = "S"
    @AppStorage("thirdSelected") private var thirdSelected = "T"
    @AppStorage("fourthSelected") private var fourthSelected = "J"
    
    @State private var showsDetailView = false
    @State private var selectedURL: URL? = nil
    
    var body: some View {
        NavigationView {
            VStack (spacing: 10) {
                HStack(spacing: 5) {
                    Picker("First letter",
                           selection: 
                            $firstSelected) {
                        ForEach(viewModel.firstLetters,
                                id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                    Picker("Second Name",
                           selection: $secondSelected) {
                        ForEach(viewModel.secondLetters,
                                id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                    Picker("Third Name",
                           selection: $thirdSelected) {
                        ForEach(viewModel.thirdLetters,
                                id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                    Picker("Fourth Name",
                           selection: $fourthSelected) {
                        ForEach(viewModel.fourthLetters,
                                id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.wheel)
                }
                
                Button("Generate type", action:{
                    let chosenCombination: String =
                    firstSelected +
                    secondSelected +
                    thirdSelected +
                    fourthSelected
                    
                    if let urlString = viewModel.typeLinks[chosenCombination], let url = URL(string: urlString) {
                        selectedURL = url
                        showsDetailView = true
                    }
                })
                .font(.title)
                .buttonStyle(BorderedButtonStyle())
                .tint(.blue)
            }
            .sheet(isPresented: $showsDetailView) {
                DetailView(url: $selectedURL)
            }
        }
         
    }
}

#Preview {
    GenerateView(viewModel: GenerateViewModel())
}
