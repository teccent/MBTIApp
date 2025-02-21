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
    var selectedURL: URL? { get }
}

class GenerateViewModel: GenerateViewModelProtocol, ObservableObject {
    
    let typeLinks = DataManager.shared.typeLinks
    
    @Published var selectedURL: URL? = nil
    
    func updateSelectedURL(for code: String) {
        if let urlString = typeLinks[code], let url = URL(string: urlString) {
            selectedURL = url
        } else {
            selectedURL = nil
        }
    }

    let firstLetters = ["E", "I"]
    
    let secondLetters = ["S", "N"]
    
    let thirdLetters = ["T", "F"]
    
    let fourthLetters = ["J", "P"]

    var selectedDescription = ""
}

