//
//  AppState.swift
//  MBTIApp
//
//  Created by Теона Магай on 17.02.2025.
//

//import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var predictions: [String] = []
    @Published var testId: String? = nil 
}
