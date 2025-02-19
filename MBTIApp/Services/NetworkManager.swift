//
//  NetworkManager.swift
//  MBTIApp
//
//  Created by Теона Магай on 01.11.2024.
//

import Foundation

// Структура для хранения testId и testUrl
struct TestData {
    let testId: String
    let testUrl: String
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}

    func fetchTestData(completion: @escaping (Result<TestData, Error>) -> Void) {
        let urlString = "https://api.devil.ai/v1/new_test?api_key=a1074d-29e37b-27c749-732edc"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Проверка на наличие ошибок
            if let error = error {
                print("Error fetching data: \(error)")
                completion(.failure(error))
                return
            }

            // Проверка на наличие данных
            guard let data = data else {
                print("No data received")
                completion(.failure(NetworkError.noData))
                return
            }

            // Декодирование JSON
            do {
                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                let testId = apiResponse.data.testId
                //let testId = "c42535046b96e1fc1c0c1107d7b1fa1567b5a82033b81486182952"
                let testUrl = apiResponse.data.testUrl
                //let testUrl = "https://devil.ai/api-personality-test/c42535046b96e1fc1c0c1107d7b1fa1567b5a82033b81486182952"
                let testData = TestData(testId: testId, testUrl: testUrl) // Создаем TestData
                completion(.success(testData)) // Возвращаем testData
                print("1 - test data: \(testData)")
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
        }

        task.resume()
    }

    
    func fetchData(completion: @escaping (Result<MBTIModel, Error>) -> Void) {
        fetchTestData { result in
            switch result {
            case .success(let testData):
                let testId = testData.testId
                
                let devilApi = "https://api.devil.ai/v1/check_test?api_key=a1074d-29e37b-27c749-732edc&test_id=\(testId)"
                //let devilApi = "https://api.devil.ai/v1/check_test?api_key=a1074d-29e37b-27c749-732edc&test_id=c42535046b96e1fc1c0c1107d7b1fa1567b5a82033b81486182952"
                
                // Проверяем, что URL валидный
                guard let url = URL(string: devilApi) else {
                    print("Неверный URL: \(devilApi)") // Проверка
                    completion(.failure(NetworkError.invalidURL))
                    return
                }

    /*
    func fetchData(testUrl: String, completion: @escaping (Result<MBTIModel, Error>) -> Void) {
            // Используем testUrl для формирования URL
            guard let url = URL(string: testUrl) else {
                print("Неверный URL: \(testUrl)") // Проверка
                completion(.failure(NetworkError.invalidURL))
                return
            }
        */
        
                print("2 - Загрузка данных по URL: \(url)") // Проверка


                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    // Обрабатываем ошибки сети
                    if let error = error {
                        print("Ошибка сети: \(error.localizedDescription)") // Проверка
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                        return
                    }


                    // Проверяем, что данные получены
                    guard let data = data else {
                        print("Данные не получены") // Проверка
                        DispatchQueue.main.async {
                            completion(.failure(NetworkError.noData))
                        }
                        return
                    }

                    // Логируем полученные данные
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("3 - Полученные данные: \(jsonString)")
                    }

                    // Декодируем JSON
                    do {
                        let response = try JSONDecoder().decode(MBTIResponse.self, from: data)

                        // Проверяем, что meta.success == true
                        guard response.meta.success else {
                            print("Meta success is false") // Проверка
                            DispatchQueue.main.async {
                                completion(.failure(NetworkError.apiError("Meta success is false")))
                            }
                            return
                        }

                        // Возвращаем данные из "data" на главном потоке
                        DispatchQueue.main.async {
                            completion(.success(response.data))
                        }
                    } catch let error {
                        print("4 - Ошибка декодирования: \(error)")
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                }.resume()

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case apiError(String)
    }
}

/*
 func fetchBooks() async throws -> [Book] {
     let url = URL(string: "https://gutendex.com/books/")!
     let (data, _) = try await URLSession.shared.data(from: url)
     let response = try JSONDecoder().decode(Response.self, from: data)
     return response.results
 }
 */

/*
 func fetchData(completion: @escaping (MBTIModel) -> Void) async throws -> [Results] {
 let url = URL(string: devilApi)!
 let (data, _) = try await URLSession.shared.data(from: url)
 let response = try JSONDecoder().decode(MBTIModel.self, from: data)
 return response.data
 }
 */
