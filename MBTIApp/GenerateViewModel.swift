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
    /*
    var firstSelected: String { get }
    var secondSelected: String { get }
    var thirdSelected: String { get }
    var fourthSelected: String { get } */
    var selectedDescription: String { get }
    
    //var showsDetailView: Bool { get }
}

class GenerateViewModel: GenerateViewModelProtocol, ObservableObject {
    
    let types = DataManager.shared.types
    
    var firstLetters = ["E", "I"]
    
    var secondLetters = ["S", "N"]
    
    var thirdLetters = ["T", "F"]
    
    var fourthLetters = ["J", "P"]
    /*
    var firstSelected = "E"
    
    var secondSelected = "S"
    
    var thirdSelected = "T"
    
    var fourthSelected = "J"
    */
    var selectedDescription = ""
    
    //var showsDetailView = false
}

/*
 var firstLetters: [String] {
     ["E", "I"]
 }
 
 var secondLetters: [String] {
     ["S", "N"]
 }
 
 var thirdLetters: [String] {
     ["T", "F"]
 }
 
 var fourthLetters: [String] {
     ["J", "P"]
 }
 
 var firstSelected: String = "E"
 
 var secondSelected: String = "S"
 
 var thirdSelected: String = "T"
 
 var fourthSelected: String = "J"
 
 var selectedDescription: String = ""
*/
