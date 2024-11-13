//
//  NetworkManager.swift
//  MBTIApp
//
//  Created by Теона Магай on 01.11.2024.
//

import SwiftUI

class NetworkManager {
    static let shared = NetworkManager()
    
    let devilJson = "https://api.devil.ai/v1/check_test?api_key=a1074d-29e37b-27c749-732edc&test_id=c42535046b96e1fc1c0c1107d7b1fa156725173cd7a53626326597"
        
        private init() {}
        
        func fetchData(from url: String?, with completion: @escaping (MBTIModel) -> Void) {
            guard let stringURL = url else { return }
            guard let url = URL(string: stringURL) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let model = try JSONDecoder().decode(MBTIModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(model)
                    }
                } catch let error {
                    print(error)
                }
                
            }.resume()
        }
}
