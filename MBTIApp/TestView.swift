//
//  TestView.swift
//  MBTIApp
//
//  Created by Теона Магай on 26.10.2024.
//

import SwiftUI

struct TestView: View {
    
    @State private var isPresentWebView = false
    @StateObject private var appState = AppState() // Используем AppState
    @StateObject private var viewModel: TestViewModel
    
    init() {
            // Инициализируем viewModel с новым экземпляром AppState
            let appState = AppState()
            self._appState = StateObject(wrappedValue: appState)
            self._viewModel = StateObject(wrappedValue: TestViewModel(appState: appState))
        }
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Your results:")
                    .font(.title)
                    .bold()
                Text(appState.predictionResult)
                Spacer()
                NavigationLink("Go to the Test", destination: TestLink(appState: appState))
                Spacer()
            }
            .onAppear {
                viewModel.loadResult() // Загружаем результаты при появлении представления
            }
        }
    }
}

#Preview {
    TestView()
}
