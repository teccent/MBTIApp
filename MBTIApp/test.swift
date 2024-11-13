//
//  test.swift
//  MBTIApp
//
//  Created by Теона Магай on 13.11.2024.
//

import SwiftUI

import SwiftUI

struct test: View {
    @State private var selected: String = ""
    
    private let selectionOptions = [
        "A",
        "B"
    ]
    private let selectionOptionsSecond = [
        "C",
        "D"
    ]
    
    var body: some View {
        NavigationStack {
            HStack {
                
                Picker("Picker Name",
                       selection: $selected) {
                    ForEach(selectionOptions,
                            id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.wheel)
                
                
                Picker("Picker Name",
                       selection: $selected) {
                    ForEach(selectionOptionsSecond,
                            id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.wheel)
                
                Picker("Picker Name",
                       selection: $selected) {
                    ForEach(selectionOptions,
                            id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.wheel)
                
                
                Picker("Picker Name",
                       selection: $selected) {
                    ForEach(selectionOptionsSecond,
                            id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.wheel)
                
            }
            Button("Go", action:
                    {
                
            })
            .font(.largeTitle)
            .buttonStyle(BorderedButtonStyle())
            .tint(.blue)
        }
    }
}

#Preview {
    test()
}
