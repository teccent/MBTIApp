//
//  TestViewModel.swift
//  MBTIApp
//
//  Created by Теона Магай on 17.11.2024.
//

import Foundation

protocol TestViewModelProtocol {
    
    func fetchResults(completion: @escaping (Result<TestViewModel.Results, Error>) -> Void)

    func loadResult()
    
}

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
    
    //@Published var predictionResult: String = "Loading..." // Значение по умолчанию
    
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
    
    func loadResult() {
        print("Загрузка результатов...") //проверка
            // Вызываем fetchResults
            fetchResults { result in
                switch result {
                case .success(let results):
                    // Успешно получили данные
                        print("Успешно загружены данные from loadResult: \(results)") //проверка
                    DispatchQueue.main.async {
                        // Обновляем appState вместо self.predictionResult
                        self.appState.predictionResult = results.prediction
                        print("appState - \(self.appState.predictionResult)")
                    }
                case .failure(let error):
                    // Обрабатываем ошибку
                    print("Ошибка: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.appState.predictionResult = "no prediction"
                    }
                }
            }
        }
    
}

/*
NetworkManager.shared.fetchData { results in
    self.results = results
    completion()
}
 */


/*
NetworkManager.shared.fetchData { [unowned self] results in
    self.results = results
    completion()
}
 */

//    func getResult() -> String {
//        results?.prediction ?? "no prediction"
//    }
/*
func getResult(completion: @escaping (String) -> Void) {
fetchResults { result in
    switch result {
    case .success(let results):
        // Возвращаем значение prediction
        completion(results.prediction)
    case .failure:
        // В случае ошибки возвращаем "no prediction"
        completion("no prediction")
    }
}
}
*/
