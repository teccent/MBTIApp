//
//  TestLink.swift
//  MBTIApp
//
//  Created by Теона Магай on 28.10.2024.
//

import SwiftUI

/*
struct TestLink: View {
    @ObservedObject var appState: AppState // Принимаем AppState
    @State private var testUrl: URL? = nil // Состояние для хранения тестового URL
    @State private var isLoading: Bool = true // Состояние загрузки

    var body: some View {
        NavigationStack {
            Group {
                if let url = testUrl {
                    WebManager(url: url)
                        .ignoresSafeArea()
                        .navigationTitle("MBTI Test")
                        .navigationBarTitleDisplayMode(.inline)
                } else if isLoading {
                    ProgressView("Loading...")
                } else {
                    Text("Failed to load the test URL.")
                }
            }
            .onAppear {
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
                         print("2 - Получен url \(String(describing: self.testUrl))")
                         self.isLoading = false // Завершаем загрузку
                         print("Загрузка завершена")
                     case .failure(let error):
                         print("Error fetching test data: \(error)")
                         self.isLoading = false // Завершаем загрузку
                 }
             }
         }
     
}
*/

/*
struct TestLink: View {
    @ObservedObject var appState: AppState // Принимаем AppState
    @State private var isLoading: Bool = true // Состояние загрузки

    var body: some View {
        NavigationStack {
            Group {
                if let url = appState.testUrl {
                    WebManager(url: url)
                        .ignoresSafeArea()
                        .navigationTitle("MBTI Test")
                        .navigationBarTitleDisplayMode(.inline)
                } else if isLoading {
                    ProgressView("Loading...")
                } else {
                    Text("Failed to load the test URL.")
                }
            }
            .onAppear {
                if appState.testUrl == nil {
                    fetchTestData()
                } else {
                    isLoading = false
                }
            }
        }
    }

    private func fetchTestData() {
        NetworkManager.shared.fetchTestData { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let testData):
                        appState.testUrl = URL(string: testData.testUrl)
                        appState.testId = testData.testId
                        isLoading = false
                    case .failure(let error):
                        print("Error fetching test data: \(error)")
                        isLoading = false
                }
            }
        }
    }
}
*/

struct TestLink: View {
    @ObservedObject var appState: AppState
    @State private var testUrl: URL? = nil
    @State private var isLoading: Bool = true

    var body: some View {
        NavigationStack {
            Group {
                if let url = testUrl {
                    WebManager(url: url)
                        .ignoresSafeArea()
                } else if isLoading {
                    ProgressView("Loading...")
                } else {
                    Text("Failed to load the test URL.")
                }
            }
            .onAppear {
                fetchTestData()
            }
        }
    }

    private func fetchTestData() {
        isLoading = true
        NetworkManager.shared.fetchTestData { result in
            switch result {
                case .success(let testData):
                    DispatchQueue.main.async {
                        self.testUrl = URL(string: testData.testUrl)
                        self.appState.testId = testData.testId // Обновляем testId
                        self.isLoading = false
                    }
                case .failure:
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
            }
        }
    }
}
    
#Preview {
    TestLink(appState: AppState())
}
