//
//  MBTIModel.swift
//  MBTIApp
//
//  Created by Теона Магай on 01.11.2024.
//

import Foundation

struct MBTIModel: Codable {
    let prediction: String
    let testId: String
    let resultsPage: URL
    
    enum CodingKeys: String, CodingKey {
        case prediction
        case testId = "test_id"
        case resultsPage = "results_page"
        }
}

// Модель для "meta"
struct MetaForMBTI: Codable {
    let success: Bool
}

// Модель для всего JSON
struct MBTIResponse: Codable {
    let meta: MetaForMBTI
    let data: MBTIModel
}



/*
 struct Response: Decodable {
     let results: [Book]
 }

 struct Book: Decodable, Identifiable {
     let id: Int
     let title: String
     let downloads: Int

     enum CodingKeys: String, CodingKey {
         case id, title
         case downloads = "download_count"
     }
 }
 
 */
