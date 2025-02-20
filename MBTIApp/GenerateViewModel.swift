//
//  GenerateViewModel.swift
//  MBTIApp
//
//  Created by Теона Магай on 04.11.2024.
//

import Foundation

protocol GenerateViewModelProtocol {
    var firstLetters: [String] { get }
    var secondLetters: [String] { get }
    var thirdLetters: [String] { get }
    var fourthLetters: [String] { get }

    var selectedDescription: String { get }
}

class GenerateViewModel: GenerateViewModelProtocol, ObservableObject {
    
    let types = DataManager.shared.types
    
    var firstLetters = ["E", "I"]
    
    var secondLetters = ["S", "N"]
    
    var thirdLetters = ["T", "F"]
    
    var fourthLetters = ["J", "P"]

    var selectedDescription = ""
}

