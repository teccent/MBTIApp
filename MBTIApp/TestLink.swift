//
//  TestLink.swift
//  MBTIApp
//
//  Created by Теона Магай on 28.10.2024.
//

import SwiftUI


struct TestLink: View {
    @ObservedObject var appState: AppState // Принимаем AppState как параметр
    @State private var testUrl: URL? = nil // Состояние для хранения тестового URL
    @State private var isLoading: Bool = true // Состояние загрузки

    var body: some View {
        NavigationStack {
            Group {
                if let url = testUrl, let urlString = testUrl {
                    WebManager(url: url)
                        .ignoresSafeArea()
                        .navigationTitle("MBTI Test")
                        .navigationBarTitleDisplayMode(.inline)
                } else if isLoading {
                    ProgressView("Loading...") // Показываем индикатор загрузки
                } else {
                    Text("Failed to load the test URL.")
                }
            }
            .onAppear {
                // Вызов fetchTestData при загрузке представления
                fetchTestData()
                print("onAppear")
            }
        }
    }

    private func fetchTestData() {
        NetworkManager.shared.fetchTestData { result in
            switch result {
                case .success(let testData):
                    // Получаем URL и обновляем состояние
                    self.testUrl = URL(string: testData.testUrl)
                    //self.testUrl = URL(string: "https://devil.ai/api-personality-test/c42535046b96e1fc1c0c1107d7b1fa1567b5a82033b81486182952")
                    print("2 - Получен url \(String(describing: self.testUrl))")
                    // Вызываем fetchData с testUrl
                    /*
                    NetworkManager.shared.fetchData(testUrl: testData.testUrl) { result in
                        switch result {
                            case .success(let mbtiData):
                                // Обновляем appState с результатами
                                DispatchQueue.main.async {
                                    self.appState.predictionResult = mbtiData.prediction
                                }
                            case .failure(let error):
                                print("Error fetching MBTI data: \(error)")
                        }
                    }
                     */
                    self.isLoading = false // Завершаем загрузку
                    print("Загрузка завершена")
                case .failure(let error):
                    print("Error fetching test data: \(error)")
                    self.isLoading = false // Завершаем загрузку
            }
        }
    }
}
    
#Preview {
    TestLink(appState: AppState())
}
