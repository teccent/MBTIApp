//
//  TestViewModel.swift
//  MBTIApp
//
//  Created by Теона Магай on 17.11.2024.
//

import Foundation


protocol TestViewModelProtocol {
    
    func fetchResults(testId: String, completion: @escaping (Result<TestViewModel.Results, Error>) -> Void)
    func loadResult(testId: String)
    
}

class TestViewModel: TestViewModelProtocol, ObservableObject {
    private var appState: AppState

    init(appState: AppState) {
        self.appState = appState
    }

    struct Results {
        let prediction: String
        let testId: String
        let resultsPage: URL
    }

    func fetchResults(testId: String, completion: @escaping (Result<Results, Error>) -> Void) {
        NetworkManager.shared.fetchData(testId: testId) { result in
            switch result {
                case .success(let mbtiData):
                    let results = Results(
                        prediction: mbtiData.prediction,
                        testId: mbtiData.testId,
                        resultsPage: mbtiData.resultsPage
                    )
                    DispatchQueue.main.async {
                        completion(.success(results))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }

    func loadResult(testId: String) {
        fetchResults(testId: testId) { result in
            switch result {
                case .success(let results):
                    DispatchQueue.main.async {
                        self.appState.predictions.append(results.prediction)
                    }
                case .failure:
                    DispatchQueue.main.async {
                        self.appState.predictions.append("No prediction")
                    }
            }
        }
    }
}

/*
class TestViewModel: TestViewModelProtocol, ObservableObject {
    private var appState: AppState

    init(appState: AppState) {
        self.appState = appState
    }

    struct Results {
        let prediction: String
        let testId: String
        let resultsPage: URL
    }

    func fetchResults(testId: String, completion: @escaping (Result<Results, Error>) -> Void) {
        NetworkManager.shared.fetchData(testId: testId) { result in
            switch result {
                case .success(let mbtiData):
                    let results = Results(
                        prediction: mbtiData.prediction,
                        testId: mbtiData.testId,
                        resultsPage: mbtiData.resultsPage
                    )
                    DispatchQueue.main.async {
                        print("Успешно загружены данные from fetchResults: \(results)")
                        completion(.success(results))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print("Ошибка при загрузке данных: \(error.localizedDescription)")
                        completion(.failure(error))
                    }
            }
        }
    }

    func loadResult(testId: String) {
        print("Загрузка результатов для testId: \(testId)") // Проверка
        fetchResults(testId: testId) { result in
            switch result {
                case .success(let results):
                    DispatchQueue.main.async {
                        self.appState.predictionResult = results.prediction
                    }
                case .failure(let error):
                    print("Ошибка: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.appState.predictionResult = "No prediction"
                    }
            }
        }
    }
}
*/

/*
class TestViewModel: TestViewModelProtocol, ObservableObject {
    
    private var appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    // Структура для результатов
    struct Results {
        let prediction: String
        let testId: String
        let resultsPage: URL
    }
    
    // Функция для загрузки и возврата результатов
    func fetchResults(completion: @escaping (Result<Results, Error>) -> Void) {
        // Используем NetworkManager.shared для загрузки данных
        NetworkManager.shared.fetchData() { result in
            switch result {
                case .success(let mbtiData):
                    // Создаем объект Results
                    let results = Results(
                        prediction: mbtiData.prediction,
                        testId: mbtiData.testId,
                        resultsPage: mbtiData.resultsPage
                    )
                    print("Успешно загружены данные from fetchResults: \(results)")
                    completion(.success(results))
                case .failure(let error):
                    print("Ошибка при загрузке данных: \(error.localizedDescription)")
                    completion(.failure(error))
            }
        }
    }
        
    func loadResult(testId: String) {
        print("Загрузка результатов для testId: \(testId)") // Проверка
        NetworkManager.shared.fetchData(testId: testId) { result in
            switch result {
                case .success(let mbtiData):
                    let results = Results(
                        prediction: mbtiData.prediction,
                        testId: mbtiData.testId,
                        resultsPage: mbtiData.resultsPage
                    )
                    DispatchQueue.main.async {
                        self.appState.predictionResult = results.prediction
                    }
                case .failure(let error):
                    print("Ошибка: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.appState.predictionResult = "No prediction"
                    }
            }
        }
    }
}
*/
