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
                    Image(systemName: "moonphase.waning.crescent")
                    Text("Generate Type")
                }
            
            TestView()
                .tabItem {
                    Image(systemName: "moonphase.new.moon.inverse")
                    Text("Test")
                }
            
            FAQView()
                .tabItem {
                    Image(systemName: "moonphase.waning.gibbous.inverse")
                    Text("FAQ")
                }
        }
        .tint((Color(hue: 0.47, saturation: 0.943, brightness: 0.639)))
    }
    
}

#Preview {
    ContentView()
}


 

 
 
