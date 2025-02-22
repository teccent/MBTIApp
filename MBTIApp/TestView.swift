//
//  TestView.swift
//  MBTIApp
//
//  Created by Теона Магай on 26.10.2024.
//

import SwiftUI

/*
 struct TestView: View {
 
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
 NavigationLink("Go to the Test", destination: TestLink(appState: AppState()))
 Spacer()
 }
 .onAppear {
 viewModel.loadResult() // Загружаем результаты при появлении представления
 }
 }
 }
 }
 */

/*
 struct TestView: View {
 @StateObject private var appState = AppState()
 @StateObject private var viewModel: TestViewModel
 
 init() {
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
 NavigationLink(destination: TestLink(appState: appState)
 .onDisappear {
 // Загружаем результаты только если testId есть
 if let testId = appState.testId {
 viewModel.loadResult(testId: testId)
 }
 }) {
 Text("Go to the Test")
 }
 Spacer()
 }
 }
 }
 }
 */

struct TestView: View {
    @StateObject private var appState = AppState()
    @StateObject private var viewModel: TestViewModel
    
    init() {
        let appState = AppState()
        self._appState = StateObject(wrappedValue: appState)
        self._viewModel = StateObject(wrappedValue: TestViewModel(appState: appState))
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("Your results:")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color(hue: 0.47, saturation: 0.943, brightness: 0.639))
                    .padding(.top, 20)
                // Показываем все сохраненные результаты как текстовые блоки
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(appState.predictions.indices, id: \.self) { index in
                            Text("\(index + 1). \(appState.predictions[index])")
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                }
                NavigationLink(destination: TestLink(appState: appState)
                    .onDisappear {
                        if let testId = appState.testId {
                            viewModel.loadResult(testId: testId)
                        }
                    }) {
                        Text("Go to the Test")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: 0.47, saturation: 0.943, brightness: 0.639))
                            .cornerRadius(15)
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 20)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background((Color(hue: 0.47, saturation: 1.0, brightness: 0.809, opacity: 0.087)).ignoresSafeArea())
        }
    }
}


#Preview {
    TestView()
}
