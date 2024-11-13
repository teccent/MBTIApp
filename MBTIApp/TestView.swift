//
//  TestView.swift
//  MBTIApp
//
//  Created by Теона Магай on 26.10.2024.
//

import SwiftUI

struct TestView: View {
    
    @State private var isPresentWebView = false
    var model: MBTIModel?
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Your results:")
                    .font(.title)
                    .bold()
                Text("about")
                Spacer()
                NavigationLink("Go to the Test", destination: TestLink())
                Spacer()
            }
        }
    }
}

#Preview {
    TestView()
}
