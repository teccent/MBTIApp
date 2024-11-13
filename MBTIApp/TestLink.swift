//
//  TestLink.swift
//  MBTIApp
//
//  Created by Теона Магай on 28.10.2024.
//

import SwiftUI

struct TestLink: View {
    var body: some View {
        NavigationStack {
            WebManager(url: URL(string: "https://devil.ai/api-personality-test/c42535046b96e1fc1c0c1107d7b1fa156725173cd7a53626326597")!)
            
                .ignoresSafeArea()
                .navigationTitle("MBTI Test")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TestLink()
}
