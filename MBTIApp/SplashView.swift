//
//  SplashView.swift
//  MBTIApp
//
//  Created by Теона Магай on 22.02.2025.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            Image("launch_image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
        }
    }
}

#Preview {
    SplashView()
}
