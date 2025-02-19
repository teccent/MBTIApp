//
//  NewTestModel.swift
//  MBTIApp
//
//  Created by Теона Магай on 17.02.2025.
//

import Foundation

struct Meta: Codable {
    let statusCode: Int
    let success: Bool
    let docsUrl: String
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case success
        case docsUrl = "docs_url"
        case totalResults = "total_results"
    }
}

struct DataResponse: Codable {
    let testId: String
    let testUrl: String
    
    enum CodingKeys: String, CodingKey {
        case testId = "test_id"
        case testUrl = "test_url"
    }
}

struct ApiResponse: Codable {
    let meta: Meta
    let data: DataResponse
}




