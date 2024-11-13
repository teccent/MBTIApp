//
//  ContentView.swift
//  MBTIApp
//
//  Created by Теона Магай on 05.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GenerateView(viewModel: GenerateViewModel())
                .tabItem {
                    Image(systemName: "filemenu.and.cursorarrow")
                    Text("Generate Type")
                }
            
            TestView()
                .tabItem {
                    Image(systemName: "person.and.background.striped.horizontal")
                    Text("Test")
                }
            
            FAQView()
                .tabItem {
                    Image(systemName: "questionmark.bubble")
                    Text("FAQ")
                }
        }
    }
    
}

#Preview {
    ContentView()
}


 

 
 
